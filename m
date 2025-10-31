Return-Path: <linux-next+bounces-8770-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F97C2362F
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 07:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E222F1890123
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 06:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5AB2F1FD2;
	Fri, 31 Oct 2025 06:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClMEu7Px"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB092E6CDC
	for <linux-next@vger.kernel.org>; Fri, 31 Oct 2025 06:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761891832; cv=none; b=oMbQK3ggFmVWdAD3Z91j+NS5rVPyMMwGhy1X4hJUJKRGMvUd3p29LBtVSPZZEWMDvAlfX/Ft7FsJXIYz5Gum19GeaNvSXU9cmbpqzCF7GJbnzqzEqTgul5T22h/z1Ou8veHp4WwBfvfkuTH7hNhxcTiXUPw12vlTy0DknK8jNzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761891832; c=relaxed/simple;
	bh=xgv92xx0HG2Tw00dFVcmkjKRrnUkDpMDlvi1iPezs8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RU5eiTf6vs5RBq7H/tsKPDuukQ2DLgZtXUxv2hen5vCm27XISXL14TtEiIOcrsLsbXKxsAiAfOczz0yIl6wNzFj+OUGM8RXAIbl0BrTIKk6kc36r68DiT4AsuJUw0+TKa1qff8vAnt8PZBbiZvSD8ju9yqqmQOQmt+wySZx5zV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClMEu7Px; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-63e076e24f2so3574582a12.3
        for <linux-next@vger.kernel.org>; Thu, 30 Oct 2025 23:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761891829; x=1762496629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hsaDLmzA1y851nG826xzJHOPvTdZ564MNJI7aO6jyM=;
        b=ClMEu7PxKTj5fgYE7Hp/9uom/QxVPsDluObVxW/H0pUb2grpElnirLiqXIBLpUz16Q
         b1rl3jPr5WaVVZ4yN90BUAP67vQo+7gXGZ20itk8nGiIxx5nJ+x5w08qDPT37bYwLfVh
         8RKCovZCmx4E9y1ZMJiOZi5WXfDSufyNORMuOvTqL4huRq9sx6J45cOKm9Pd6/vUarPP
         Bp38YCvFhcFhQ+LPN5k9ywTWRhpKx0l9AT9S456A/YPp7pqxJnBlNserKz3gr9Alvadc
         aogjdKbRkrdAkF6oRNffl32Wfdwz3lVQA5+4c4oTYwXNKuZzpvL4yzZ1b5RLk5tDMPot
         Wa+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761891829; x=1762496629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hsaDLmzA1y851nG826xzJHOPvTdZ564MNJI7aO6jyM=;
        b=lSoEH+m/XmenkB6osbAyTtL25skskEOGIC5JtFFB30SqCDK9Dungttir+teSFD5+t3
         27G+ZtlEykVpiZg3wLlakgm7+VUegwjRJDki06RWOia3X9+NFgPaZ0wKEgXEvSXVqVht
         6ZzImYkxIOwh96cEJa/nWXjNH5zQgLrr2is1AKhnoLQrqSolhVre4GZaOmMxLYIwoU0S
         uV2vv04hdcaiJ8LKYI0Yvl9GrKVFnnVW0LH1lTz2S7HR2UxmsbITlClDILPnSz1456Nb
         gzvmdllYhH6sAI5AJ5dSpAuXyaFb7+2MxBkVLPp1sbyYaJNnH0+c/K/XoIxPBi0oE6/H
         AKZg==
X-Forwarded-Encrypted: i=1; AJvYcCWNNQFW74jWu0txyFHSP1V/lIBaXlZOOLnXe5WcJPqquCqFOluuoOabAygR3J2dzzxjfzsOzXPXsVw+@vger.kernel.org
X-Gm-Message-State: AOJu0YxlPMl65AxiIinBz35dhBlro4GcpE8bDSJiyOgaW5eJjavCopR3
	XfbcMx4+SWX9o8kJ0p4zJdWGegqz7pKfiPb/En3xUqzpo1JyM1xGEDlVQsOAY1Ae7lTFtv4NJpS
	dutxJ0loSnCMNPKiknOdpecfvq2M6odU=
X-Gm-Gg: ASbGncs5pemGnrjWZDW+W2AG9H0yhi1UUbQ8LtZ18wWSOxwDB42YMlSKt6yjDi5Sh8k
	CHTCX84ERo5WfQ2kSCJ+YN604VT8/QgDYqPie70ccXj2p9HUrZUW4Ck6KMEAqFTiL7U4ehFp0nB
	9dpTgGKCp2lljw5yCPDzwN52vD/Cl5PBHct7AHdrf/aFMnb8kva262VERCsJeSKL2NSTOQkS7nG
	yfIsbEtBgN8RZfuqa+80Putz1uePXwQULQnMwt9Ao2upFlrFyMNHfnz3hPm
X-Google-Smtp-Source: AGHT+IF6j1vxumSjj/XCqKSlAYaG3zCZ1WGX2j0YwY+mrm+Qmdw5dS6bfwxw05xrBpje3Ug8ib44To5v3jIB+EG0UqM=
X-Received: by 2002:a05:6402:4517:b0:639:e712:cd6c with SMTP id
 4fb4d7f45d1cf-6407704fa44mr1748212a12.13.1761891829070; Thu, 30 Oct 2025
 23:23:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030085146.37ab6bd4@canb.auug.org.au> <87ecqlny9u.fsf@trenco.lwn.net>
In-Reply-To: <87ecqlny9u.fsf@trenco.lwn.net>
From: Alex Shi <seakeel@gmail.com>
Date: Fri, 31 Oct 2025 14:23:12 +0800
X-Gm-Features: AWmQ_bm_WiCbeQ3eHJgZgrv_8iXmgSfALUe2sa9-9O3umCZHJuQN-YaBRCy4aI8
Message-ID: <CAJy-Amkt3zO=tbJLF6Oejs7QN7XtEZuwt2tESiGQYiFi30jYUw@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the jc_docs tree
To: Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alex Shi <alexs@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

Oops,  I appligize for the missing, It's my fault. I will add my
signed-off and resend the request full with updated tag
Chinese-docs-6.18.
I will make sure it not happen again.

Thanks a lot!
Alex

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2025=E5=B9=B410=E6=9C=8830=E6=97=
=A5=E5=91=A8=E5=9B=9B 06:22=E5=86=99=E9=81=93=EF=BC=9A

>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>
> > Hi all,
> >
> > Commits
> >
> >   564f84128bd2 ("docs/zh_CN: Add translation of rust/testing.rst")
> >   6d4a6d623098 ("docs/zh_CN: Add secrets coco Chinese translation")
> >   344657696e9a ("docs/zh_CN: Add sd-parameters.rst translation")
> >   989a716b1677 ("docs/zh_CN: Add link_power_management_policy.rst trans=
lation")
> >   6c07193cb80f ("docs/zh_CN: Add scsi-parameters.rst translation")
> >   cfd923323d14 ("docs/zh_CN: Add scsi_eh.rst translation")
> >   da6572ec7105 ("docs/zh_CN: Add scsi_mid_low_api.rst translation")
> >   16dfba1581b5 ("docs/zh_CN: Add scsi.rst translation")
> >   9162cb790b42 ("docs/zh_CN: Add scsi/index.rst translation")
> >   fe67964dd6e2 ("docs/zh_CN: Update Rust index translation and add refe=
rence label")
> >   1e108599ebfe ("docs/zh_CN: Add security SCTP Chinese translation")
> >   b12bb7728152 ("Docs/zh_CN: Translate timestamping.rst to Simplified C=
hinese")
> >   4d926084ce6d ("docs/zh_CN: Add security lsm-development Chinese trans=
lation")
> >   6d624576ca3f ("Docs/zh_CN: fix the format of proofreader")
> >   25cf7924b579 ("Docs/zh_CN: align title underline for ubifs.rst")
> >   e3f873992cc4 ("Docs/zh_CN: add fixed format for the header of gfs2-gl=
ocks.rst")
> >   37b1e0d4ab11 ("docs/zh_CN: Add security ipe Chinese translation")
> >   ab530c5fca9b ("Docs/zh_CN: Translate generic-hdlc.rst to Simplified C=
hinese")
> >   d3e7609c6e5e ("Docs/zh_CN: Translate skbuff.rst to Simplified Chinese=
")
> >   6d35e61606d0 ("Docs/zh_CN: Translate mptcp-sysctl.rst to Simplified C=
hinese")
> >   0694113d49b5 ("Docs/zh_CN: Translate inotify.rst to Simplified Chines=
e")
> >   f4121e639fd3 ("Docs/zh_CN: Translate dnotify.rst to Simplified Chines=
e")
> >   250fc3d68a90 ("Docs/zh_CN: Translate gfs2-glocks.rst to Simplified Ch=
inese")
> >   a502ffe48523 ("Docs/zh_CN: Translate gfs2-uevents.rst to Simplified C=
hinese")
> >   46ea6a90b59d ("Docs/zh_CN: Translate gfs2.rst to Simplified Chinese")
> >   e0bb4c3524df ("Docs/zh_CN: Translate ubifs-authentication.rst to Simp=
lified Chinese")
> >   fe460c3ec8b1 ("Docs/zh_CN: Translate ubifs.rst to Simplified Chinese"=
)
> >
> > are missing a Signed-off-by from their committers.
>
> Argh.  Thanks for the heads-up.
>
> Alex, I have dropped the Chinese pull from docs-next ... needless to
> say, you need to pay attention to details like this if I am to be able
> to pull your tree.  Please fix these up, and we'll try again.
>
> Thanks,
>
> jon

