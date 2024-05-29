/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Samir/Desktop/VHDL/Peta lab vezba/stoperica_2/stoperica.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_0597673896_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(60, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 7388U);
    t3 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t1);
    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t3;
    xsi_driver_first_trans_fast(t4);

LAB2:    t9 = (t0 + 4448);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0597673896_3212880686_p_1(char *t0)
{
    char t15[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    int t12;
    int t13;
    unsigned char t14;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned char t25;

LAB0:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 2272U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4464);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(65, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t5 = t1;
    memset(t5, (unsigned char)2, 8U);
    t6 = (t0 + 4624);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t11 = (t4 == (unsigned char)3);
    if (t11 != 0)
        goto LAB7;

LAB9:
LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t2 = (t0 + 7404U);
    t12 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t6, t2);
    t7 = (t0 + 2472U);
    t8 = *((char **)t7);
    t13 = *((int *)t8);
    t14 = (t12 < t13);
    if (t14 != 0)
        goto LAB10;

LAB12:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB15;

LAB16:    t1 = (t0 + 1352U);
    t5 = *((char **)t1);
    t11 = *((unsigned char *)t5);
    t14 = (t11 == (unsigned char)3);
    if (t14 != 0)
        goto LAB17;

LAB18:
LAB11:    goto LAB8;

LAB10:    xsi_set_current_line(69, ng0);
    t7 = (t0 + 2152U);
    t9 = *((char **)t7);
    t7 = (t0 + 7404U);
    t10 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t15, t9, t7, 1);
    t16 = (t15 + 12U);
    t17 = *((unsigned int *)t16);
    t18 = (1U * t17);
    t19 = (8U != t18);
    if (t19 == 1)
        goto LAB13;

LAB14:    t20 = (t0 + 4624);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t10, 8U);
    xsi_driver_first_trans_fast(t20);
    goto LAB11;

LAB13:    xsi_size_not_matching(8U, t18, 0);
    goto LAB14;

LAB15:    goto LAB11;

LAB17:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 2152U);
    t6 = *((char **)t1);
    t1 = (t0 + 7404U);
    t12 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t6, t1);
    t7 = (t0 + 2472U);
    t8 = *((char **)t7);
    t13 = *((int *)t8);
    t19 = (t12 < t13);
    if (t19 != 0)
        goto LAB19;

LAB21:
LAB20:    goto LAB11;

LAB19:    xsi_set_current_line(73, ng0);
    t7 = (t0 + 2152U);
    t9 = *((char **)t7);
    t7 = (t0 + 7404U);
    t10 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t15, t9, t7, 1);
    t16 = (t15 + 12U);
    t17 = *((unsigned int *)t16);
    t18 = (1U * t17);
    t25 = (8U != t18);
    if (t25 == 1)
        goto LAB22;

LAB23:    t20 = (t0 + 4624);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t10, 8U);
    xsi_driver_first_trans_fast(t20);
    goto LAB20;

LAB22:    xsi_size_not_matching(8U, t18, 0);
    goto LAB23;

}

static void work_a_0597673896_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(80, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 4688);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4480);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0597673896_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0597673896_3212880686_p_0,(void *)work_a_0597673896_3212880686_p_1,(void *)work_a_0597673896_3212880686_p_2};
	xsi_register_didat("work_a_0597673896_3212880686", "isim/tb_isim_beh.exe.sim/work/a_0597673896_3212880686.didat");
	xsi_register_executes(pe);
}
