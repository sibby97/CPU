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
static unsigned int ng0[] = {1U, 0U};



static void Gate_514_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    t1 = (t0 + 3008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t5 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 15);
    t8 = (t7 & 1);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 15);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t12 = (t0 + 1208U);
    t13 = *((char **)t12);
    t12 = (t0 + 3936);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    xsi_vlog_XorGate(t17, 2, t4, t13);
    t18 = (t0 + 3936);
    xsi_driver_vfirst_trans(t18, 0, 0);
    t19 = (t0 + 3824);
    *((int *)t19) = 1;

LAB1:    return;
}

static void Gate_515_1(char *t0)
{
    char t4[8];
    char t14[8];
    char t24[8];
    char t34[8];
    char t44[8];
    char t54[8];
    char t64[8];
    char t74[8];
    char t84[8];
    char t94[8];
    char t104[8];
    char t114[8];
    char t124[8];
    char t134[8];
    char t144[8];
    char t154[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    char *t53;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    char *t73;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    char *t82;
    char *t83;
    char *t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;
    char *t93;
    char *t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    char *t102;
    char *t103;
    char *t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    char *t112;
    char *t113;
    char *t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;
    char *t123;
    char *t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    char *t132;
    char *t133;
    char *t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    char *t142;
    char *t143;
    char *t145;
    unsigned int t146;
    unsigned int t147;
    unsigned int t148;
    unsigned int t149;
    unsigned int t150;
    unsigned int t151;
    char *t152;
    char *t153;
    char *t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    unsigned int t160;
    unsigned int t161;
    char *t162;
    char *t163;
    char *t164;
    char *t165;
    char *t166;
    char *t167;
    char *t168;

LAB0:    t1 = (t0 + 3256U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t5 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 15);
    t8 = (t7 & 1);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 15);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t12 = (t0 + 1368U);
    t13 = *((char **)t12);
    memset(t14, 0, 8);
    t12 = (t14 + 4);
    t15 = (t13 + 4);
    t16 = *((unsigned int *)t13);
    t17 = (t16 >> 14);
    t18 = (t17 & 1);
    *((unsigned int *)t14) = t18;
    t19 = *((unsigned int *)t15);
    t20 = (t19 >> 14);
    t21 = (t20 & 1);
    *((unsigned int *)t12) = t21;
    t22 = (t0 + 1368U);
    t23 = *((char **)t22);
    memset(t24, 0, 8);
    t22 = (t24 + 4);
    t25 = (t23 + 4);
    t26 = *((unsigned int *)t23);
    t27 = (t26 >> 13);
    t28 = (t27 & 1);
    *((unsigned int *)t24) = t28;
    t29 = *((unsigned int *)t25);
    t30 = (t29 >> 13);
    t31 = (t30 & 1);
    *((unsigned int *)t22) = t31;
    t32 = (t0 + 1368U);
    t33 = *((char **)t32);
    memset(t34, 0, 8);
    t32 = (t34 + 4);
    t35 = (t33 + 4);
    t36 = *((unsigned int *)t33);
    t37 = (t36 >> 12);
    t38 = (t37 & 1);
    *((unsigned int *)t34) = t38;
    t39 = *((unsigned int *)t35);
    t40 = (t39 >> 12);
    t41 = (t40 & 1);
    *((unsigned int *)t32) = t41;
    t42 = (t0 + 1368U);
    t43 = *((char **)t42);
    memset(t44, 0, 8);
    t42 = (t44 + 4);
    t45 = (t43 + 4);
    t46 = *((unsigned int *)t43);
    t47 = (t46 >> 11);
    t48 = (t47 & 1);
    *((unsigned int *)t44) = t48;
    t49 = *((unsigned int *)t45);
    t50 = (t49 >> 11);
    t51 = (t50 & 1);
    *((unsigned int *)t42) = t51;
    t52 = (t0 + 1368U);
    t53 = *((char **)t52);
    memset(t54, 0, 8);
    t52 = (t54 + 4);
    t55 = (t53 + 4);
    t56 = *((unsigned int *)t53);
    t57 = (t56 >> 10);
    t58 = (t57 & 1);
    *((unsigned int *)t54) = t58;
    t59 = *((unsigned int *)t55);
    t60 = (t59 >> 10);
    t61 = (t60 & 1);
    *((unsigned int *)t52) = t61;
    t62 = (t0 + 1368U);
    t63 = *((char **)t62);
    memset(t64, 0, 8);
    t62 = (t64 + 4);
    t65 = (t63 + 4);
    t66 = *((unsigned int *)t63);
    t67 = (t66 >> 9);
    t68 = (t67 & 1);
    *((unsigned int *)t64) = t68;
    t69 = *((unsigned int *)t65);
    t70 = (t69 >> 9);
    t71 = (t70 & 1);
    *((unsigned int *)t62) = t71;
    t72 = (t0 + 1368U);
    t73 = *((char **)t72);
    memset(t74, 0, 8);
    t72 = (t74 + 4);
    t75 = (t73 + 4);
    t76 = *((unsigned int *)t73);
    t77 = (t76 >> 8);
    t78 = (t77 & 1);
    *((unsigned int *)t74) = t78;
    t79 = *((unsigned int *)t75);
    t80 = (t79 >> 8);
    t81 = (t80 & 1);
    *((unsigned int *)t72) = t81;
    t82 = (t0 + 1368U);
    t83 = *((char **)t82);
    memset(t84, 0, 8);
    t82 = (t84 + 4);
    t85 = (t83 + 4);
    t86 = *((unsigned int *)t83);
    t87 = (t86 >> 7);
    t88 = (t87 & 1);
    *((unsigned int *)t84) = t88;
    t89 = *((unsigned int *)t85);
    t90 = (t89 >> 7);
    t91 = (t90 & 1);
    *((unsigned int *)t82) = t91;
    t92 = (t0 + 1368U);
    t93 = *((char **)t92);
    memset(t94, 0, 8);
    t92 = (t94 + 4);
    t95 = (t93 + 4);
    t96 = *((unsigned int *)t93);
    t97 = (t96 >> 6);
    t98 = (t97 & 1);
    *((unsigned int *)t94) = t98;
    t99 = *((unsigned int *)t95);
    t100 = (t99 >> 6);
    t101 = (t100 & 1);
    *((unsigned int *)t92) = t101;
    t102 = (t0 + 1368U);
    t103 = *((char **)t102);
    memset(t104, 0, 8);
    t102 = (t104 + 4);
    t105 = (t103 + 4);
    t106 = *((unsigned int *)t103);
    t107 = (t106 >> 5);
    t108 = (t107 & 1);
    *((unsigned int *)t104) = t108;
    t109 = *((unsigned int *)t105);
    t110 = (t109 >> 5);
    t111 = (t110 & 1);
    *((unsigned int *)t102) = t111;
    t112 = (t0 + 1368U);
    t113 = *((char **)t112);
    memset(t114, 0, 8);
    t112 = (t114 + 4);
    t115 = (t113 + 4);
    t116 = *((unsigned int *)t113);
    t117 = (t116 >> 4);
    t118 = (t117 & 1);
    *((unsigned int *)t114) = t118;
    t119 = *((unsigned int *)t115);
    t120 = (t119 >> 4);
    t121 = (t120 & 1);
    *((unsigned int *)t112) = t121;
    t122 = (t0 + 1368U);
    t123 = *((char **)t122);
    memset(t124, 0, 8);
    t122 = (t124 + 4);
    t125 = (t123 + 4);
    t126 = *((unsigned int *)t123);
    t127 = (t126 >> 3);
    t128 = (t127 & 1);
    *((unsigned int *)t124) = t128;
    t129 = *((unsigned int *)t125);
    t130 = (t129 >> 3);
    t131 = (t130 & 1);
    *((unsigned int *)t122) = t131;
    t132 = (t0 + 1368U);
    t133 = *((char **)t132);
    memset(t134, 0, 8);
    t132 = (t134 + 4);
    t135 = (t133 + 4);
    t136 = *((unsigned int *)t133);
    t137 = (t136 >> 2);
    t138 = (t137 & 1);
    *((unsigned int *)t134) = t138;
    t139 = *((unsigned int *)t135);
    t140 = (t139 >> 2);
    t141 = (t140 & 1);
    *((unsigned int *)t132) = t141;
    t142 = (t0 + 1368U);
    t143 = *((char **)t142);
    memset(t144, 0, 8);
    t142 = (t144 + 4);
    t145 = (t143 + 4);
    t146 = *((unsigned int *)t143);
    t147 = (t146 >> 1);
    t148 = (t147 & 1);
    *((unsigned int *)t144) = t148;
    t149 = *((unsigned int *)t145);
    t150 = (t149 >> 1);
    t151 = (t150 & 1);
    *((unsigned int *)t142) = t151;
    t152 = (t0 + 1368U);
    t153 = *((char **)t152);
    memset(t154, 0, 8);
    t152 = (t154 + 4);
    t155 = (t153 + 4);
    t156 = *((unsigned int *)t153);
    t157 = (t156 >> 0);
    t158 = (t157 & 1);
    *((unsigned int *)t154) = t158;
    t159 = *((unsigned int *)t155);
    t160 = (t159 >> 0);
    t161 = (t160 & 1);
    *((unsigned int *)t152) = t161;
    t162 = (t0 + 4000);
    t163 = (t162 + 56U);
    t164 = *((char **)t163);
    t165 = (t164 + 56U);
    t166 = *((char **)t165);
    xsi_vlog_NorGate(t166, 16, t4, t14, t24, t34, t44, t54, t64, t74, t84, t94, t104, t114, t124, t134, t144, t154);
    t167 = (t0 + 4000);
    xsi_driver_vfirst_trans(t167, 0, 0);
    t168 = (t0 + 3840);
    *((int *)t168) = 1;

LAB1:    return;
}

static void Gate_516_2(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    t1 = (t0 + 3504U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t5 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 15);
    t8 = (t7 & 1);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 15);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t12 = ((char*)((ng0)));
    t13 = (t0 + 4064);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    xsi_vlog_AndGate(t17, 2, t4, t12);
    t18 = (t0 + 4064);
    xsi_driver_vfirst_trans(t18, 0, 0);
    t19 = (t0 + 3856);
    *((int *)t19) = 1;

LAB1:    return;
}


extern void work_m_00000000003070301745_0300432699_init()
{
	static char *pe[] = {(void *)Gate_514_0,(void *)Gate_515_1,(void *)Gate_516_2};
	xsi_register_didat("work_m_00000000003070301745_0300432699", "isim/testbench_isim_beh.exe.sim/work/m_00000000003070301745_0300432699.didat");
	xsi_register_executes(pe);
}
