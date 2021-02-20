Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319843206F9
	for <lists+linux-next@lfdr.de>; Sat, 20 Feb 2021 20:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhBTTxC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 20 Feb 2021 14:53:02 -0500
Received: from st43p00im-ztfb10071701.me.com ([17.58.63.173]:52475 "EHLO
        st43p00im-ztfb10071701.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229784AbhBTTxB (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sat, 20 Feb 2021 14:53:01 -0500
X-Greylist: delayed 391 seconds by postgrey-1.27 at vger.kernel.org; Sat, 20 Feb 2021 14:53:00 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
        t=1613850333; bh=Qi878eYyG4TdAPbifSnuWM5PboJzJlSyg87HYP5nMF4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=0K1XG5kCfms6Ol1kUfFA3w72dH9gqCAMibNaxG0ExQQPaSegX9zedrFD0h6hDVi6N
         /PjvOR+DGNOcZJFvaXxTmySTET+X9NRMxGIhFYoVz8Rl2jckPKWqJFP420QNEXJCl2
         3Vbw+Xple+SvhyQ6UqQ6GuooLtfTFk+hferrGbu6VX4Pbhb1JWZ6XnodUwOv5V8yE/
         sgrJZHOuHcBj3bPRzUE/txA0E5EYGPSEm1kCGNQ/KTdN0wSFy5zaySOoG67wbLG82C
         Mnl/7ahbN8ilI4EtyrwMq6xCvamKx+Uk7dqpEC8OVWbvRQTPbh9yVISBh7AMjdkRHT
         YyMEk0DMh0O/w==
Received: from gnbcxl0029.gnb.st.com (101.220.150.77.rev.sfr.net [77.150.220.101])
        by st43p00im-ztfb10071701.me.com (Postfix) with ESMTPSA id 8C9898A0559;
        Sat, 20 Feb 2021 19:45:29 +0000 (UTC)
Date:   Sat, 20 Feb 2021 20:45:25 +0100
From:   Alain Volmat <avolmat@me.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Message-ID: <20210220194524.GA4200@gnbcxl0029.gnb.st.com>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210202090135.04b9890e@canb.auug.org.au>
 <20210215091444.3300fb43@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215091444.3300fb43@canb.auug.org.au>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-20_02:2021-02-18,2021-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2102200183
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

sorry for the delay, is there anything I should do concerning this issue
?

Cheers,
Alain

On Mon, Feb 15, 2021 at 09:14:44AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 2 Feb 2021 09:01:35 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the arm-soc tree got a conflict in:
> > 
> >   arch/arm/Kconfig.debug
> > 
> > between commits:
> > 
> >   9ca4efec0aba ("ARM: 9040/1: use DEBUG_UART_PHYS and DEBUG_UART_VIRT for sti LL_UART")
> >   6e959ad8bb90 ("ARM: 9041/1: sti LL_UART: add STiH418 SBC UART0 support")
> > 
> > from the arm tree and commits:
> > 
> >   f3a732843acc ("ARM: remove sirf prima2/atlas platforms")
> >   89d4f98ae90d ("ARM: remove zte zx platform")
> > 
> > from the arm-soc tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > diff --cc arch/arm/Kconfig.debug
> > index 7a8697a97c98,c36c5d4c6e9c..000000000000
> > --- a/arch/arm/Kconfig.debug
> > +++ b/arch/arm/Kconfig.debug
> > @@@ -1623,10 -1546,7 +1550,9 @@@ config DEBUG_LL_INCLUD
> >   	default "debug/renesas-scif.S" if DEBUG_RMOBILE_SCIFA4
> >   	default "debug/s3c24xx.S" if DEBUG_S3C24XX_UART || DEBUG_S3C64XX_UART
> >   	default "debug/s5pv210.S" if DEBUG_S5PV210_UART
> > - 	default "debug/sirf.S" if DEBUG_SIRFSOC_UART
> >  -	default "debug/sti.S" if DEBUG_STI_UART
> >  +	default "debug/sti.S" if DEBUG_STIH41X_ASC2
> >  +	default "debug/sti.S" if DEBUG_STIH41X_SBC_ASC1
> >  +	default "debug/sti.S" if DEBUG_STIH418_SBC_ASC0
> >   	default "debug/stm32.S" if DEBUG_STM32_UART
> >   	default "debug/tegra.S" if DEBUG_TEGRA_UART
> >   	default "debug/ux500.S" if DEBUG_UX500_UART
> > @@@ -1659,8 -1579,6 +1585,7 @@@ config DEBUG_UART_PHY
> >   	default 0x02531000 if DEBUG_KEYSTONE_UART1
> >   	default 0x03010fe0 if ARCH_RPC
> >   	default 0x07000000 if DEBUG_SUN9I_UART0
> > - 	default 0x09405000 if DEBUG_ZTE_ZX
> >  +	default 0x09530000 if DEBUG_STIH418_SBC_ASC0
> >   	default 0x10009000 if DEBUG_REALVIEW_STD_PORT || \
> >   				DEBUG_VEXPRESS_UART0_CA9
> >   	default 0x1010c000 if DEBUG_REALVIEW_PB1176_PORT
> > @@@ -1789,10 -1698,8 +1707,10 @@@
> >   		DEBUG_RMOBILE_SCIFA4 || DEBUG_S3C24XX_UART || \
> >   		DEBUG_S3C64XX_UART || \
> >   		DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
> > - 		DEBUG_SIRFSOC_UART || DEBUG_DIGICOLOR_UA0 || \
> > + 		DEBUG_DIGICOLOR_UA0 || \
> >  -		DEBUG_AT91_UART || DEBUG_STM32_UART
> >  +		DEBUG_AT91_UART || DEBUG_STM32_UART || \
> >  +		DEBUG_STIH41X_ASC2 || DEBUG_STIH41X_SBC_ASC1 || \
> >  +		DEBUG_STIH418_SBC_ASC0
> >   
> >   config DEBUG_UART_VIRT
> >   	hex "Virtual base address of debug UART"
> > @@@ -1854,12 -1760,9 +1772,11 @@@
> >   	default 0xfb020000 if DEBUG_OMAP3UART3
> >   	default 0xfb042000 if DEBUG_OMAP3UART4
> >   	default 0xfb10c000 if DEBUG_REALVIEW_PB1176_PORT
> > - 	default 0xfc705000 if DEBUG_ZTE_ZX
> >   	default 0xfcfe8600 if DEBUG_BCM63XX_UART
> >   	default 0xfd000000 if DEBUG_SPEAR3XX || DEBUG_SPEAR13XX
> >  +	default 0xfd531000 if DEBUG_STIH41X_SBC_ASC1
> >   	default 0xfd883000 if DEBUG_ALPINE_UART0
> >  +	default 0xfdd32000 if DEBUG_STIH41X_ASC2
> >   	default 0xfe010000 if STM32MP1_DEBUG_UART
> >   	default 0xfe017000 if DEBUG_MMP_UART2
> >   	default 0xfe018000 if DEBUG_MMP_UART3
> > @@@ -1904,10 -1802,8 +1816,10 @@@
> >   		DEBUG_QCOM_UARTDM || DEBUG_S3C24XX_UART || \
> >   		DEBUG_S3C64XX_UART || \
> >   		DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
> > - 		DEBUG_SIRFSOC_UART || DEBUG_DIGICOLOR_UA0 || \
> > + 		DEBUG_DIGICOLOR_UA0 || \
> >  -		DEBUG_AT91_UART || DEBUG_STM32_UART
> >  +		DEBUG_AT91_UART || DEBUG_STM32_UART || \
> >  +		DEBUG_STIH41X_ASC2 || DEBUG_STIH41X_SBC_ASC1 || \
> >  +		DEBUG_STIH418_SBC_ASC0
> >   
> >   config DEBUG_UART_8250_SHIFT
> >   	int "Register offset shift for the 8250 debug UART"
> 
> With the merge window about to open, this is a reminder that this
> conflict still exists.
> 
> -- 
> Cheers,
> Stephen Rothwell


