Return-Path: <linux-next+bounces-8886-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF8DC3CFB7
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 19:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF80E3B629C
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 17:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D5334EEFA;
	Thu,  6 Nov 2025 17:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSa0AzFx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2535F3502A5
	for <linux-next@vger.kernel.org>; Thu,  6 Nov 2025 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762451882; cv=none; b=uXMllXFGIw7KxcGq2HxhIf6QocQqljDuqYs+SmIwvvBVbHDZmvNdN3AyoN2lYg46DyNrrf5gsGubTNpBrNmnaEzkIds73Y+0D/F1JAmtAaIWIeoj91F5QwuHa5kmaIYoFmjowqEF3E7xULCsc61hDYVKgoZYO5XIr5GtR/hJ3A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762451882; c=relaxed/simple;
	bh=glDJwADkOumTnv2wh0y8hasj3tQrqspeLBN3EP/hPeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UnqWRLST1Z0OtU+3lu9ylPpQI5THcF4LCuR8AqdbdkS4lZBOIPhRTktNKJibr28ij2vEnBxoWnpJ3U4vKnZ7viJG4G8lwVI0EdL8bHXCgyd8Bcg7nJWwuaI+KGb6SAZhcLmr1QUQBVgrVDerekvZQrJymHCKkHAR+YxINksmPkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSa0AzFx; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b994baabfcfso783252a12.3
        for <linux-next@vger.kernel.org>; Thu, 06 Nov 2025 09:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762451880; x=1763056680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qq2BG8wI9bIT4TcMCE4faFvSiiQMg+JzNyI7cyMI09g=;
        b=HSa0AzFxYv7Eywl+uuTcMiBDZCL4x61QFtqaeTalq9vAF+EBARPsAutYojSSzBXY/j
         HgyJE+Kczrqr/XsUX9wkUO0jm1ekeMQxNjTWYQ6aEfcry9/BrWxs2nxG2C0CZZwngyWL
         e5a/dtezsaRTnUneG7iAnR4TA4jqBL436pwIqVwc0XmggagxM2jLRTNHmxO0bwUDFeqL
         VXeGMsQiMuCmT8DtKZlDXcb3Y+BA2LPLPjArZzaRcjwENq4uzZLV/vkRTZWuBlrbphIw
         KGAUq++7NbOMwv5wnOBWVWpeRTz7duDVEwPCmRbIp5Jp9ksCqL6qiG2Lxy4kRjRzKtom
         Omvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762451880; x=1763056680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qq2BG8wI9bIT4TcMCE4faFvSiiQMg+JzNyI7cyMI09g=;
        b=OMdqUIv6M1ku2DrGCffOTl5DEOOXj8z4mMQjDjgQq9kat5WHW67DWtoPkxipcZmmZv
         cESz0l7zKsvrnvEy91nMbL436foIXvGdEAY8r63azTKhR9GgRXF6KJM7fjQBAiUN5qT2
         IoaBHHdM1VOSOXE2PYOoRibOp6hQhKk45C+vceeZOlP/Edinrq2DuO1sIY16ggRQvgdJ
         T+Bp3+zT3MRVKNohrkDl22ALZ1BklzN/y5hWCDHIQ9A+T1B04MzXZH6ctMztT2y8+j0f
         8Rhbf51O6y33BHO2O+Zgx7RR51O1/fpCiXdjkT6KCVnUIOJplcGfwMyHA4LMmRpGuyeP
         ZHgA==
X-Forwarded-Encrypted: i=1; AJvYcCUFvHLaucEjH4um3C+yQXwT1Ky7GLhR3HI1s+vYUz4AGU4/KqS29CNbsh3aFcKyDHTbDC0s75qav9jK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgp2B3BPO/940edeRKMSEeF5FVCf/GVgzFhEjR7DW7isvKLnIW
	gJ8ntTmEtiKsJeISefGeWIIVwjjRf2GDFHamky4abrMUGo1myqNgHB071pkpCTEOCYKyCxUYlEb
	0BBZ+qGt72J4/SFju1s5KwPJDW1KyWMw=
X-Gm-Gg: ASbGnct4HC80Q1k3Rt9jq1srZzVJm/SC7gBJbUcIgDuiH40ByCPcQaAjdzKQeFzazae
	0nWbMXeP2zaS7DN1W/IIMDZhLOFwZWL5yQMiJBJaNHWhcgaGfxtXCnSu3hyAOuYZ3aDvhoOdPpc
	Sfjt5FN/9qnxfnnLVDLt4V1VcTyXmjE5so8saZff7TDIUKpbCpwzB98zJLUm/M0WlnuyXF+l6Ib
	NtVu4zUG0y8kiSCZSl49Y+Dy5GNpy+/n34swAWOKRCrzdoxgzcvH8FLunYc9Tvyn5BIhwrCIb7a
	vNDRJ4MMAFA=
X-Google-Smtp-Source: AGHT+IEo2c3LTKhoAWPaU5mA29bYX/vQ3YlDfexEaLKPDZKxloUHe6GGY5t624x7bqLaqtKa75S0FMw4WhtkQE0EKKo=
X-Received: by 2002:a17:902:db0b:b0:297:c048:fb60 with SMTP id
 d9443c01a7336-297c048fb72mr3932805ad.25.1762451880461; Thu, 06 Nov 2025
 09:58:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106113519.544d147d@canb.auug.org.au>
In-Reply-To: <20251106113519.544d147d@canb.auug.org.au>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 6 Nov 2025 09:57:46 -0800
X-Gm-Features: AWmQ_bm8E-PozACS9d1X9w71i5ba0KKhj-9cPqMEYJ2xotNsfTlmXkti2aB73FA
Message-ID: <CAEf4BzbDyeMG4KdgryqFTTT3t5EQWRsKf8n1W6AHL_VOW0SC7A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Mykyta Yatsenko <yatsenko@meta.com>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 4:35=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   kernel/bpf/helpers.c
>
> between commits:
>
>   ea0714d61dea ("bpf:add _impl suffix for bpf_task_work_schedule* kfuncs"=
)
>   137cc92ffe2e ("bpf: add _impl suffix for bpf_stream_vprintk() kfunc")
>
> from the bpf tree and commit:
>
>   8d8771dc03e4 ("bpf: add plumbing for file-backed dynptr")
>
> from the bpf-next tree.
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
> diff --cc kernel/bpf/helpers.c
> index e4007fea4909,865b0dae38d1..000000000000
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@@ -4380,9 -4531,11 +4535,11 @@@ BTF_ID_FLAGS(func, bpf_strncasestr)
>   #if defined(CONFIG_BPF_LSM) && defined(CONFIG_CGROUPS)
>   BTF_ID_FLAGS(func, bpf_cgroup_read_xattr, KF_RCU)
>   #endif
>  -BTF_ID_FLAGS(func, bpf_stream_vprintk, KF_TRUSTED_ARGS)
>  -BTF_ID_FLAGS(func, bpf_task_work_schedule_signal, KF_TRUSTED_ARGS)
>  -BTF_ID_FLAGS(func, bpf_task_work_schedule_resume, KF_TRUSTED_ARGS)
>  +BTF_ID_FLAGS(func, bpf_stream_vprintk_impl, KF_TRUSTED_ARGS)
>  +BTF_ID_FLAGS(func, bpf_task_work_schedule_signal_impl, KF_TRUSTED_ARGS)
>  +BTF_ID_FLAGS(func, bpf_task_work_schedule_resume_impl, KF_TRUSTED_ARGS)
> + BTF_ID_FLAGS(func, bpf_dynptr_from_file, KF_TRUSTED_ARGS)
> + BTF_ID_FLAGS(func, bpf_dynptr_file_discard)
>   BTF_KFUNCS_END(common_btf_ids)

LGTM, thanks

>
>   static const struct btf_kfunc_id_set common_kfunc_set =3D {

