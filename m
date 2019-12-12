Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5112A11C145
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2019 01:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfLLAYM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Dec 2019 19:24:12 -0500
Received: from mail.rptsys.com ([23.155.224.45]:3143 "EHLO mail.rptsys.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727128AbfLLAYM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Dec 2019 19:24:12 -0500
X-Greylist: delayed 461 seconds by postgrey-1.27 at vger.kernel.org; Wed, 11 Dec 2019 19:24:11 EST
Received: from localhost (localhost [127.0.0.1])
        by mail.rptsys.com (Postfix) with ESMTP id 1B60AF4814A21;
        Wed, 11 Dec 2019 18:16:30 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
        by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 3ZguppylM-EI; Wed, 11 Dec 2019 18:16:28 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
        by mail.rptsys.com (Postfix) with ESMTP id C263FF48149E1;
        Wed, 11 Dec 2019 18:16:28 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C263FF48149E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
        t=1576109788; bh=IFG5YIjxkPyD9LA2qlwHFHG51vT2LDZp6lx/xnyq+PY=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=IFIy3MeFsb1Rm6mWlaAzatG7s8KOJp9X0nPGTUxcrASyFHiTmnpBREIlntTYPx8rz
         kGYlpQLUJVqJpcIslmAbUNIQB7wAailjywvpVy1LjU5mADNpNyx6NqwSiTQp1C3Kcj
         6/nVuH2ICm53xiLacbgkOKVAQhF57hREQbsk2coc=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
        by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id BZTW_6UYPJAo; Wed, 11 Dec 2019 18:16:28 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
        by mail.rptsys.com (Postfix) with ESMTP id 96808F48149D6;
        Wed, 11 Dec 2019 18:16:28 -0600 (CST)
Date:   Wed, 11 Dec 2019 18:16:27 -0600 (CST)
From:   Timothy Pearson <tpearson@raptorengineering.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <1363559590.4979794.1576109787742.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20191212110245.6f63732b@canb.auug.org.au>
References: <20191212110245.6f63732b@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the amdgpu tree with Linus' tree
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC65 (Linux)/8.5.0_GA_3042)
Thread-Topic: linux-next: manual merge of the amdgpu tree with Linus' tree
Thread-Index: Vt6Yhmqb1oFnoQ2p4nl1dsvjbM/SGg==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The new version looks OK from my side.

----- Original Message -----
> From: "Stephen Rothwell" <sfr@canb.auug.org.au>
> To: "Alex Deucher" <alexdeucher@gmail.com>
> Cc: "Linux Next Mailing List" <linux-next@vger.kernel.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "Nick
> Desaulniers" <ndesaulniers@google.com>, "Timothy Pearson" <tpearson@raptorengineering.com>
> Sent: Wednesday, December 11, 2019 6:03:37 PM
> Subject: linux-next: manual merge of the amdgpu tree with Linus' tree

> Hi all,
> 
> Today's linux-next merge of the amdgpu tree got conflicts in:
> 
>  drivers/gpu/drm/amd/display/dc/calcs/Makefile
>  drivers/gpu/drm/amd/display/dc/dcn20/Makefile
>  drivers/gpu/drm/amd/display/dc/dcn21/Makefile
>  drivers/gpu/drm/amd/display/dc/dml/Makefile
>  drivers/gpu/drm/amd/display/dc/dsc/Makefile
> 
> between commits:
> 
>  c868868f6b6a ("drm/amdgpu: fix stack alignment ABI mismatch for Clang")
>  00db297106e8 ("drm/amdgpu: fix stack alignment ABI mismatch for GCC 7.1+")
> 
> from Linus' tree and commit:
> 
>  86462415d58d ("amdgpu: Enable initial DCN support on POWER")
> 
> from the amdgpu tree.
> 
> I fixed it up (I think .. see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 
> --
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/gpu/drm/amd/display/dc/calcs/Makefile
> index 26c6d735cdc7,4d3006bd4337..000000000000
> --- a/drivers/gpu/drm/amd/display/dc/calcs/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/calcs/Makefile
> @@@ -24,22 -25,23 +25,30 @@@
>  # It calculates Bandwidth and Watermarks values for HW programming
>  #
>  
> -ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
> -	cc_stack_align := -mpreferred-stack-boundary=4
> -else ifneq ($(call cc-option, -mstack-alignment=16),)
> -	cc_stack_align := -mstack-alignment=16
> ++ifdef CONFIG_X86
> +calcs_ccflags := -mhard-float -msse
> + endif
> +
> -ifdef CONFIG_X86
> -calcs_ccflags := -mhard-float -msse $(cc_stack_align)
> ++ifdef CONFIG_PPC64
> ++calcs_ccflags := -mhard-float -maltivec
> ++endif
>  
> -ifdef CONFIG_CC_IS_CLANG
> -calcs_ccflags += -msse2
> +ifdef CONFIG_CC_IS_GCC
> +ifeq ($(call cc-ifversion, -lt, 0701, y), y)
> +IS_OLD_GCC = 1
>  endif
>  endif
>  
> -ifdef CONFIG_PPC64
> -calcs_ccflags := -mhard-float -maltivec $(cc_stack_align)
> +ifdef IS_OLD_GCC
> +# Stack alignment mismatch, proceed with caution.
> +# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
> +# (8B stack alignment).
> +calcs_ccflags += -mpreferred-stack-boundary=4
> +else
> ++ifdef CONFIG_X86
> +calcs_ccflags += -msse2
> +endif
> + endif
>  
>  CFLAGS_$(AMDDALPATH)/dc/calcs/dcn_calcs.o := $(calcs_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/calcs/dcn_calc_auto.o := $(calcs_ccflags)
> diff --cc drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> index 63f3bddba7da,07f652d40f86..000000000000
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> @@@ -6,26 -7,25 +7,32 @@@ DCN20 = dcn20_resource.o dcn20_init.o d
>  		dcn20_stream_encoder.o dcn20_link_encoder.o dcn20_dccg.o \
>  		dcn20_vmid.o dcn20_dwb.o dcn20_dwb_scl.o
>  
> - ifdef CONFIG_DRM_AMD_DC_DSC_SUPPORT
>  DCN20 += dcn20_dsc.o
> - endif
>  
> -ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
> -	cc_stack_align := -mpreferred-stack-boundary=4
> -else ifneq ($(call cc-option, -mstack-alignment=16),)
> -	cc_stack_align := -mstack-alignment=16
> ++ifdef CONFIG_X86
> +CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o := -mhard-float -msse
> + endif
> +
> -ifdef CONFIG_X86
> -CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o := -mhard-float -msse
> $(cc_stack_align)
> ++ifdef CONFIG_PPC64
> ++CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o := -mhard-float -maltivec
> ++endif
>  
> -ifdef CONFIG_CC_IS_CLANG
> -CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o += -msse2
> +ifdef CONFIG_CC_IS_GCC
> +ifeq ($(call cc-ifversion, -lt, 0701, y), y)
> +IS_OLD_GCC = 1
>  endif
>  endif
>  
> -ifdef CONFIG_PPC64
> -CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o := -mhard-float -maltivec
> $(cc_stack_align)
> +ifdef IS_OLD_GCC
> +# Stack alignment mismatch, proceed with caution.
> +# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
> +# (8B stack alignment).
> +CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o += -mpreferred-stack-boundary=4
> +else
> ++ifdef CONFIG_X86
> +CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o += -msse2
> +endif
> + endif
>  
>  AMD_DAL_DCN20 = $(addprefix $(AMDDALPATH)/dc/dcn20/,$(DCN20))
>  
> diff --cc drivers/gpu/drm/amd/display/dc/dcn21/Makefile
> index 14113ccf498d,041464d001bd..000000000000
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
> @@@ -1,24 -2,26 +2,33 @@@
>  #
>  # Makefile for DCN21.
>  
> - DCN21 = dcn21_hubp.o dcn21_hubbub.o dcn21_resource.o dcn21_hwseq.o
> dcn21_link_encoder.o
> + DCN21 = dcn21_init.o dcn21_hubp.o dcn21_hubbub.o dcn21_resource.o \
> + 	 dcn21_hwseq.o dcn21_link_encoder.o
>  
> -ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
> -	cc_stack_align := -mpreferred-stack-boundary=4
> -else ifneq ($(call cc-option, -mstack-alignment=16),)
> -	cc_stack_align := -mstack-alignment=16
> ++ifdef CONFIG_X86
> +CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o := -mhard-float -msse
> + endif
> +
> -ifdef CONFIG_X86
> -CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o := -mhard-float -msse
> $(cc_stack_align)
> ++ifdef CONFIG_PPC64
> ++CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o := -mhard-float -maltivec
> ++endif
>  
> -ifdef CONFIG_CC_IS_CLANG
> -CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o += -msse2
> +ifdef CONFIG_CC_IS_GCC
> +ifeq ($(call cc-ifversion, -lt, 0701, y), y)
> +IS_OLD_GCC = 1
>  endif
>  endif
>  
> -ifdef CONFIG_PPC64
> -CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o := -mhard-float -maltivec
> $(cc_stack_align)
> +ifdef IS_OLD_GCC
> +# Stack alignment mismatch, proceed with caution.
> +# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
> +# (8B stack alignment).
> +CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o += -mpreferred-stack-boundary=4
> +else
> ++ifdef CONFIG_X86
> +CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o += -msse2
> +endif
> + endif
>  
>  AMD_DAL_DCN21 = $(addprefix $(AMDDALPATH)/dc/dcn21/,$(DCN21))
>  
> diff --cc drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 8df251626e22,82c8978c81ab..000000000000
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@@ -24,22 -25,23 +25,30 @@@
>  # It provides the general basic services required by other DAL
>  # subcomponents.
>  
> -ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
> -	cc_stack_align := -mpreferred-stack-boundary=4
> -else ifneq ($(call cc-option, -mstack-alignment=16),)
> -	cc_stack_align := -mstack-alignment=16
> ++ifdef CONFIG_X86
> +dml_ccflags := -mhard-float -msse
> + endif
> +
> -ifdef CONFIG_X86
> -dml_ccflags := -mhard-float -msse $(cc_stack_align)
> ++ifdef CONFIG_PPC64
> ++dml_ccflags := -mhard-float -maltivec
> ++endif
>  
> -ifdef CONFIG_CC_IS_CLANG
> -dml_ccflags += -msse2
> +ifdef CONFIG_CC_IS_GCC
> +ifeq ($(call cc-ifversion, -lt, 0701, y), y)
> +IS_OLD_GCC = 1
>  endif
>  endif
>  
> -ifdef CONFIG_PPC64
> -dml_ccflags := -mhard-float -maltivec $(cc_stack_align)
> +ifdef IS_OLD_GCC
> +# Stack alignment mismatch, proceed with caution.
> +# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
> +# (8B stack alignment).
> +dml_ccflags += -mpreferred-stack-boundary=4
> +else
> ++ifdef CONFIG_X86
> +dml_ccflags += -msse2
> +endif
> + endif
>  
>  CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
>  
> diff --cc drivers/gpu/drm/amd/display/dc/dsc/Makefile
> index 970737217e53,08edd919ec82..000000000000
> --- a/drivers/gpu/drm/amd/display/dc/dsc/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dsc/Makefile
> @@@ -1,22 -2,23 +2,30 @@@
>  #
>  # Makefile for the 'dsc' sub-component of DAL.
>  
> -ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
> -	cc_stack_align := -mpreferred-stack-boundary=4
> -else ifneq ($(call cc-option, -mstack-alignment=16),)
> -	cc_stack_align := -mstack-alignment=16
> ++ifdef CONFIG_X86
> +dsc_ccflags := -mhard-float -msse
> + endif
> +
> -ifdef CONFIG_X86
> -dsc_ccflags := -mhard-float -msse $(cc_stack_align)
> ++ifdef CONFIG_PPC64
> ++dsc_ccflags := -mhard-float -maltivec
> ++endif
>  
> -ifdef CONFIG_CC_IS_CLANG
> -dsc_ccflags += -msse2
> +ifdef CONFIG_CC_IS_GCC
> +ifeq ($(call cc-ifversion, -lt, 0701, y), y)
> +IS_OLD_GCC = 1
>  endif
>  endif
>  
> -ifdef CONFIG_PPC64
> -dsc_ccflags := -mhard-float -maltivec $(cc_stack_align)
> +ifdef IS_OLD_GCC
> +# Stack alignment mismatch, proceed with caution.
> +# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
> +# (8B stack alignment).
> +dsc_ccflags += -mpreferred-stack-boundary=4
> +else
> ++ifdef CONFIG_X86
> +dsc_ccflags += -msse2
> +endif
> + endif
>  
>  CFLAGS_$(AMDDALPATH)/dc/dsc/rc_calc.o := $(dsc_ccflags)
>   CFLAGS_$(AMDDALPATH)/dc/dsc/rc_calc_dpi.o := $(dsc_ccflags)
