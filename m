Return-Path: <linux-next+bounces-2541-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ABE906495
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 09:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4734B22DC6
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 07:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925DF134410;
	Thu, 13 Jun 2024 07:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3Mw8ayb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33C8622;
	Thu, 13 Jun 2024 07:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718262480; cv=none; b=mNfbqY2gmGCrsVqZtxYruQDVqUDGDQ0qF/m+KAkqJxCtLsHDqNXjuWYBJRrTvOniK9Z4MlI6haSRAD8PXfusrXYKzm+i6W3LSBLe+Hq3UJTEfAvlfx6EShg85jxtu/O5egZPZv8T5220jyQVnJCx68BwkDt/4lm6UopE5zZUJ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718262480; c=relaxed/simple;
	bh=zrDFScfcikrU7bUAvkqfwW+vW3KYSgLGcr9ISTlBXVo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wrl8NV6fgU+YT/vvBr8EYZ+Mw2TjF15bL9licchsDxTcdeWD4WvyvmdO0kla4LYKXmo8FHM9F6lxzjwyEEQDuoIImUMSVoS4JRLA1PyLUejKAO+egv+5u9ySQjtV+IgVTAD5jNlefy66MJjmtzuTh/PXfp6J9mmCkqSV55a8v3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3Mw8ayb; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a63359aaaa6so91141666b.2;
        Thu, 13 Jun 2024 00:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718262477; x=1718867277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5K1TysxBDaQmTf6RUixuxW9mcV3ex+8Sx8WLgjO8MU=;
        b=P3Mw8ayb/5+cQuTso1cTnAKEa1JsiPSS9cC+wE7kFXdy/OSv8PFr0k2b9qygU9PeYu
         cIEO93Yq3BwcXThREDwzOWcuxkvCTAnPXBadl7urBqkWy8spIeFzhAlgfUZ0EBMelwfJ
         hh1Aepf9p5EnisH7LtVO3h68Ds6KeNQ3FgzSd/ls0Eg0E4b89aF0GHCLvuwSf7arfxED
         8/OezjTktnd+1hDwFiWlGXD2YnkW9STNFJEtm4Ue3FCmv5ovigSOhnkuzDfhuzoMeDDr
         DzEPOEgDjjj3yvs0/Q6kxltgkJLqTMTebIV/DzojbuwTAcxthzOIqPahqlxIKX6foay+
         WDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718262477; x=1718867277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5K1TysxBDaQmTf6RUixuxW9mcV3ex+8Sx8WLgjO8MU=;
        b=BJG1Qiu1UqJug424Q5+CJka+iRDDGxW9iHxbov4sqUcA4noaRMyK+RAhFLfjp/g3FC
         BmELWRuAxLWSMET4exRa2mi7uM7jusuWJKCLfLNXVAeckuD8AIJ8IznPlKlGMVbzJ5AZ
         tHhlS0htkTreibkOWja7MbiKCj1ox9Oz75PXWxBV4O+ETW9yhcPziOJZJ02+vTgHtBNP
         3kC1a3FOX3SYFKrzzxXA7hLsNZcbB7DWam2i/5eVvEhB7EyWhGkznT+fIBW26P+cNMs6
         juAPoRZN/vyCQ4fuZkdvaVClegJm6nTvkPTfT8/HEGdbILd7VSNjWYFZb41SVM0y32cT
         cCYw==
X-Forwarded-Encrypted: i=1; AJvYcCUZz6lzIfp8bys0gcQ2v6i/XOBMHJ7z8FY8gFDtHto59k1ciI/KFMaF9rsw+l8u2hCNwQwby3s9ioiydW/OSjd/oOirI2+A4+gVeEo5IasbgnTYU4G6lFHkbVyu4WvbkNyMb1xRmEThVw==
X-Gm-Message-State: AOJu0YzQJ+B1M3cjLzY67xqMRCMAFcVxMGsD/ujGWKSpOTOhEdWX2JLD
	k7IWu2LdqOJ9SKZjzCm0mRuDZ/sw3mU46HoyENaaqgS3Fa3HkpKLORe1dA==
X-Google-Smtp-Source: AGHT+IG3E5406SWQnw8ahmj5dVQyBVPGOW5TVUEoCEjGZSdFdaCURT8BT2gXBsF97ZCpNbG9NEf40w==
X-Received: by 2002:a17:906:1354:b0:a6f:1473:379c with SMTP id a640c23a62f3a-a6f47d56e26mr233199866b.45.1718262476820;
        Thu, 13 Jun 2024 00:07:56 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56fa674bsm39584466b.210.2024.06.13.00.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 00:07:56 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 13 Jun 2024 09:07:54 +0200
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with the vfs-brauner
 tree
Message-ID: <ZmqaytbJ0r0EXO8d@krava>
References: <20240613114243.2a50059b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613114243.2a50059b@canb.auug.org.au>

On Thu, Jun 13, 2024 at 11:42:43AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the ftrace tree got conflicts in:
> 
>   arch/x86/entry/syscalls/syscall_64.tbl
>   include/uapi/asm-generic/unistd.h
> 
> between commit:
> 
>   e6873349f700 ("fs/xattr: add *at family syscalls")
> 
> from the vfs-brauner tree and commit:
> 
>   190fec72df4a ("uprobe: Wire up uretprobe system call")
> 
> from the ftrace tree.
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
> diff --cc arch/x86/entry/syscalls/syscall_64.tbl
> index 26af003921d2,6452c2ec469a..000000000000
> --- a/arch/x86/entry/syscalls/syscall_64.tbl
> +++ b/arch/x86/entry/syscalls/syscall_64.tbl
> @@@ -385,10 -384,7 +385,11 @@@
>   460	common	lsm_set_self_attr	sys_lsm_set_self_attr
>   461	common	lsm_list_modules	sys_lsm_list_modules
>   462 	common  mseal			sys_mseal
>  -463	64	uretprobe		sys_uretprobe
>  +463	common	setxattrat		sys_setxattrat
>  +464	common	getxattrat		sys_getxattrat
>  +465	common	listxattrat		sys_listxattrat
>  +466	common	removexattrat		sys_removexattrat
> ++467	64	uretprobe		sys_uretprobe
>   
>   #
>   # Due to a historical design error, certain syscalls are numbered differently
> diff --cc include/uapi/asm-generic/unistd.h
> index 5b8dab0b934e,2378f88d5ad4..000000000000
> --- a/include/uapi/asm-generic/unistd.h
> +++ b/include/uapi/asm-generic/unistd.h
> @@@ -845,17 -845,11 +845,20 @@@ __SYSCALL(__NR_lsm_list_modules, sys_ls
>   #define __NR_mseal 462
>   __SYSCALL(__NR_mseal, sys_mseal)
>   
>  -#define __NR_uretprobe 463
>  +#define __NR_setxattrat 463
>  +__SYSCALL(__NR_setxattrat, sys_setxattrat)
>  +#define __NR_getxattrat 464
>  +__SYSCALL(__NR_getxattrat, sys_getxattrat)
>  +#define __NR_listxattrat 465
>  +__SYSCALL(__NR_listxattrat, sys_listxattrat)
>  +#define __NR_removexattrat 466
>  +__SYSCALL(__NR_removexattrat, sys_removexattrat)
>  +
> ++#define __NR_uretprobe 467
> + __SYSCALL(__NR_uretprobe, sys_uretprobe)

hi,
we need one more change in tests (below), otherwise lgtm
I can send formal patch for you if needed, plz let me know

thanks,
jirka


---
diff --git a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c b/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
index c8517c8f5313..bd8c75b620c2 100644
--- a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
+++ b/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
@@ -216,7 +216,7 @@ static void test_uretprobe_regs_change(void)
 }
 
 #ifndef __NR_uretprobe
-#define __NR_uretprobe 463
+#define __NR_uretprobe 467
 #endif
 
 __naked unsigned long uretprobe_syscall_call_1(void)

