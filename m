Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08DCE131511
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 16:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgAFPqg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Mon, 6 Jan 2020 10:46:36 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:40408 "EHLO
        smtp2200-217.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726546AbgAFPqg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jan 2020 10:46:36 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.02586491|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0879799-0.00448999-0.90753;DS=CONTINUE|ham_alarm|0.587195-0.000244349-0.412561;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16368;MF=ren_guo@c-sky.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.GXLz0W7_1578325585;
Received: from it-c02z45m7lvcf.lan(mailfrom:ren_guo@c-sky.com fp:SMTPD_---.GXLz0W7_1578325585)
          by smtp.aliyun-inc.com(10.147.41.121);
          Mon, 06 Jan 2020 23:46:25 +0800
Content-Type: text/plain;
        charset=gb2312
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: linux-next: manual merge of the csky tree with Linus' tree
From:   Guo Ren <ren_guo@c-sky.com>
In-Reply-To: <20200106092029.00d365da@canb.auug.org.au>
Date:   Mon, 6 Jan 2020 23:46:25 +0800
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@suse.de>
Content-Transfer-Encoding: 8BIT
Message-Id: <A7FF4A71-F073-4336-AD20-7B803949C543@c-sky.com>
References: <20200106092029.00d365da@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Fixed with new rebase on linux-5.5-rc4 for csky linux-next

Best Regards
  Guo Ren



> 在 2020年1月6日，上午6:20，Stephen Rothwell <sfr@canb.auug.org.au> 写道：
> 
> Hi all,
> 
> FIXME: Add owner of second tree to To:
>       Add author(s)/SOB of conflicting commits.
> 
> Today's linux-next merge of the csky tree got a conflict in:
> 
>  arch/csky/kernel/vmlinux.lds.S
> 
> between commit:
> 
>  eaf937075c9a ("vmlinux.lds.h: Move NOTES into RO_DATA")
> 
> from Linus' tree and commit:
> 
>  338ef1d06f0c ("csky: Tightly-Coupled Memory or Sram support")
> 
> from the csky tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/csky/kernel/vmlinux.lds.S
> index 2ff37beaf2bf,02b35d916fe7..000000000000
> --- a/arch/csky/kernel/vmlinux.lds.S
> +++ b/arch/csky/kernel/vmlinux.lds.S
> @@@ -49,10 -51,59 +51,58 @@@ SECTION
> 
> 
>  	_sdata = .;
> -	RO_DATA_SECTION(PAGE_SIZE)
> -	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
> +	RO_DATA(PAGE_SIZE)
> +	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
>  	_edata = .;
> 
> + #ifdef CONFIG_HAVE_TCM
> + 	.tcm_start : {
> + 		. = ALIGN(PAGE_SIZE);
> + 		__tcm_start = .;
> + 	}
> + 
> + 	.text_data_tcm FIXADDR_TCM : AT(__tcm_start)
> + 	{
> + 		. = ALIGN(4);
> + 		__stcm_text_data = .;
> + 		*(.tcm.text)
> + 		*(.tcm.rodata)
> + #ifndef CONFIG_HAVE_DTCM
> + 		*(.tcm.data)
> + #endif
> + 		. = ALIGN(4);
> + 		__etcm_text_data = .;
> + 	}
> + 
> + 	. = ADDR(.tcm_start) + SIZEOF(.tcm_start) + SIZEOF(.text_data_tcm);
> + 
> + #ifdef CONFIG_HAVE_DTCM
> + 	#define ITCM_SIZE	CONFIG_ITCM_NR_PAGES * PAGE_SIZE
> + 
> + 	.dtcm_start : {
> + 		__dtcm_start = .;
> + 	}
> + 
> + 	.data_tcm FIXADDR_TCM + ITCM_SIZE : AT(__dtcm_start)
> + 	{
> + 		. = ALIGN(4);
> + 		__stcm_data = .;
> + 		*(.tcm.data)
> + 		. = ALIGN(4);
> + 		__etcm_data = .;
> + 	}
> + 
> + 	. = ADDR(.dtcm_start) + SIZEOF(.data_tcm);
> + 
> + 	.tcm_end : AT(ADDR(.dtcm_start) + SIZEOF(.data_tcm)) {
> + #else
> + 	.tcm_end : AT(ADDR(.tcm_start) + SIZEOF(.text_data_tcm)) {
> + #endif
> + 		. = ALIGN(PAGE_SIZE);
> + 		__tcm_end = .;
> + 	}
> + #endif
> + 
> -	NOTES
>  	EXCEPTION_TABLE(L1_CACHE_BYTES)
>  	BSS_SECTION(L1_CACHE_BYTES, PAGE_SIZE, L1_CACHE_BYTES)
>  	VBR_BASE

