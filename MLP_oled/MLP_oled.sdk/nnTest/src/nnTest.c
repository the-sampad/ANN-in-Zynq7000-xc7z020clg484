/*
 * nnTest.c
 *
 */


#include "dataValues7.h"
#include "xaxidma.h"
#include "xparameters.h"
#include "xil_cache.h"
#include "xscugic.h"
#include "sleep.h"

XScuGic IntcInstance;
XAxiDma myDma;

int done = 0;

static void nnISR();


int main(){
    u32 status;
    u32 detectedDigit;

	XAxiDma_Config *myDmaConfig;

	myDmaConfig = XAxiDma_LookupConfigBaseAddr(XPAR_AXI_DMA_0_BASEADDR);
	status = XAxiDma_CfgInitialize(&myDma, myDmaConfig);
	if(status != XST_SUCCESS){
		print("DMA initialization failed\n");
		return -1;
	}

	XScuGic_Config *IntcConfig;
	IntcConfig = XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);
	status =  XScuGic_CfgInitialize(&IntcInstance, IntcConfig, IntcConfig->CpuBaseAddress);
	if(status != XST_SUCCESS){
		xil_printf("Interrupt controller initialization failed..");
		return -1;
	}

	XScuGic_SetPriorityTriggerType(&IntcInstance,XPAR_FABRIC_MLP_OLED_0_INTR_INTR,0xA0,3);
	status = XScuGic_Connect(&IntcInstance,XPAR_FABRIC_MLP_OLED_0_INTR_INTR,(Xil_InterruptHandler)nnISR,0);
	if(status != XST_SUCCESS){
		xil_printf("Interrupt connection failed");
		return -1;
	}
	XScuGic_Enable(&IntcInstance,XPAR_FABRIC_MLP_OLED_0_INTR_INTR);
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,(Xil_ExceptionHandler)XScuGic_InterruptHandler,(void *)&IntcInstance);
	Xil_ExceptionEnable();

	status = XAxiDma_SimpleTransfer(&myDma, (u32)dataValues,28*28,XAXIDMA_DMA_TO_DEVICE);
	if(status != XST_SUCCESS){
		print("DMA initialization failed\n");
		return -1;
	}

	while(!done);

	detectedDigit = Xil_In32(XPAR_XDCFG_0_BASEADDR+8);

	xil_printf("Detected number %lu expected number %d\n\r",detectedDigit,result);
}



static void nnISR(){
	done = 1;
	Xil_In32(XPAR_XDCFG_0_BASEADDR+24); //read clear interrupt
}

