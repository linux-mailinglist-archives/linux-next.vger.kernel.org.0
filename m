Return-Path: <linux-next+bounces-9072-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A8489C6819F
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 09:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 06BDA3515E1
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 07:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E183019CB;
	Tue, 18 Nov 2025 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1KiXERk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DF92F28F5
	for <linux-next@vger.kernel.org>; Tue, 18 Nov 2025 07:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763452537; cv=none; b=bH7VFWuqMVJRGzxAQ9gK7D4Fg5kRqATPPlZehGBoAi7ZZSxIvd/SaTzJGG3o4k9GNt+iraYQ9nmzFW6InZ/DE9odz3u2hh1Nxhx/DCobFwJS/w+0ox9B3nnv4eiAVmQCjUWkDVCKx6q/sWvLN2zAAFEtlt8pCPeQdR5JOTIEZ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763452537; c=relaxed/simple;
	bh=zNrkdUuKPfPSpb6Alu7i6kngo7VBT++DuLlMGdoIN38=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=Hj32WvoSoGez7ehtlI08C/MFI4lRYN955KwD4boWrm8LkaoGwIl8vYt5HVtfjGLUeUmBoSnjx/x3k9UehLLC42rGvT7mmXKfH91oaYmXmUwt11B92UsYQQX2w9JqKurKol/I7frsAJSn2bG4ocyLQjSPHHqY+0h6YqKUJfFx56M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1KiXERk; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29853ec5b8cso60366785ad.3
        for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 23:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763452535; x=1764057335; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o7/syqaVN3OFRUvQzya5/mq097BnRjYmCSiy+yZAENc=;
        b=R1KiXERkLCDyzht7iijvmi3XUwFDeD7BCNHUGvQ+j/pSW4qo9pcNL99mDIJ57xehu1
         a5IYXNGms2NLLVuGc0LaJmDomeSdl1Ty/+Ot2aDoDwV42PSl0QI9TQPdA6eF05Vhac2y
         1vcR6x/5apbU2mLjkX/nC7VlFWgfD3Fq5ubQb8euxbO409q1llibUs/PBoZfn23KodgL
         +AYjWD784nxBNsHvSGjIB7hOP8+2Gb7/TUi09ubXM/coMx0cW5/ZYx0+L+Al8Dde4kwQ
         ue0LSQWuk/KIMDOcoMlOjROkgk2NVIJom+zP+Gm/eKhrf6CVi2mMxybKtRiClVGwXwvm
         cxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763452535; x=1764057335;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7/syqaVN3OFRUvQzya5/mq097BnRjYmCSiy+yZAENc=;
        b=I4PmZ4jrB9oM1T40fHEiI31raeh2wE27C23XTXhSip1fGrRaeSTMLLhFzOjAyl1N0y
         iw8AcPheeNVqBA5+N512gKUvNLttLhs6VXUh0f+pRnpviCSwDO9SJy3Azxw5olBXpLwt
         s7fY25dpYBe9r2Yg4lsUuL2fAO5LjV/05Mes9g2qnPOL//zeB99gnAP6rOkKfFFUeuCY
         1Sf+2nZpOnAYpiEXZdc44TabP6OcFXX+LLSQixGCj3dVrsdvDf2Q3JNx3XatloHajLIL
         fFkF69+o0lK2uf4Wvnz0uGOvumPB2MhJZfC/+NvRxMEypu6AsV+/KydCwVUlup1H+71L
         ag9w==
X-Forwarded-Encrypted: i=1; AJvYcCXgffMdB3Ecc4/CHAkXLL4fkzrLjsSEIcGExyrWVi6bR3AnnnbgI2owRjB1u3m6dAar03PkqC6k8tf2@vger.kernel.org
X-Gm-Message-State: AOJu0YyfSwFj7UTlkWpkoUV7grplJZ7T6rhotD6sVotet7A0nVIg2Y3N
	7y8gvOJKZMeYQ0jN0vN/Pa+cnSfu1YCQs+KY9EtWYl0nvFCfrGV4QmtE+hIdwQ==
X-Gm-Gg: ASbGncu9vg5qRM9/CDW2G0hv4t/Im9PdvEhN7M9idUvX+DMGGER+QGaaR6Fbgrp1MHR
	K2REx+zNNRel2GIFOv+NFpxvFpd8YlzWAKmGF0b6EGC2ynr1LjTUgDPVC2glA382ntXIZUQ5ns8
	8fdajwcY+xt5jRqK7JV+3bi/OYqkSRMDevn304iSe/soCVgE3p6S0DBgkKLIiYWHlnHc+PPDj9q
	MkZR3btoIJgSpmwwbBjWkkK+eNOz6D0zGL9RkWnj/Gcf+mqy6v/TLve58xKirtkYNO07PZjHDD5
	2NmLHVHJvf1QzyCK0Krtvo+p/u/9d46DojLuRLNn8u5XjYbh2hlnpNSB0o6cUNIqu3lBwSuYk5u
	1xykA9qdzOeYn3vmL9g3kUl3pjX/1eELR/TkgR4eL1gF4ZZ41JBZIqBFrbprQaAVV8fwOFkKLn+
	ZqwA==
X-Google-Smtp-Source: AGHT+IGIAchNoEHFNNrUZtM+TDOe+4ACVDLvPqJloOk/sC0eRCbgmSifY6wNhf27PIzrHEaASBfebw==
X-Received: by 2002:a17:903:904:b0:295:2276:6704 with SMTP id d9443c01a7336-2986a76821bmr154935035ad.51.1763452535158;
        Mon, 17 Nov 2025 23:55:35 -0800 (PST)
Received: from dw-tp ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm764612a91.3.2025.11.17.23.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:55:34 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Misbah Anjum N <misanjum@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org
Subject: Re: [REGRESSION] [next-20251117] ppc64le: WARNING in vmalloc_fix_flags with __GFP_ACCOUNT in BPF/seccomp path
In-Reply-To: <dbe42ce9543dbc3af95f95d6a6d9540b@linux.ibm.com>
Date: Tue, 18 Nov 2025 13:21:24 +0530
Message-ID: <87bjkz3hj7.ritesh.list@gmail.com>
References: <dbe42ce9543dbc3af95f95d6a6d9540b@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Misbah Anjum N <misanjum@linux.ibm.com> writes:

> Hi,
>
> I'm reporting a regression in linux-next that was introduced between 
> 20251114 and 20251117.
>
> Regression Info:
> - Working: 6.18.0-rc5-next-20251114
> - Broken: 6.18.0-rc6-next-20251117
>
> Environment:
> - IBM Power11 pSeries (ppc64le)
> - Fedora43 Distro
>
> Issue:
> WARNING: mm/vmalloc.c:3937 at vmalloc_fix_flags+0x6c/0xa0
> "Unexpected gfp: 0x400000 (__GFP_ACCOUNT). Fixing up to gfp: 0xdc0 
> (GFP_KERNEL|__GFP_ZERO). Fix your code!"
>
> Call Trace:
> [  523.921345] Unexpected gfp: 0x400000 (__GFP_ACCOUNT). Fixing up to 
> gfp: 0xdc0 (GFP_KERNEL|__GFP_ZERO). Fix your code!
> [  523.921356] WARNING: mm/vmalloc.c:3937 at 
> vmalloc_fix_flags+0x6c/0xa0, CPU#69: (ostnamed)/6500

This was reported here too - 
https://lore.kernel.org/all/69158bb1.a70a0220.3124cb.001e.GAE@google.com/


Looks like it should be fixed with v3, which was posted just
yesterday... 
https://lore.kernel.org/all/20251117173530.43293-2-vishal.moola@gmail.com/

So, I guess, latest linux-next should not show this warning on ppc64le either.

-ritesh

