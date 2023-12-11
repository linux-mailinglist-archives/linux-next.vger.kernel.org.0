Return-Path: <linux-next+bounces-324-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B8280C463
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 10:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C1FF1F21107
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 09:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2F321116;
	Mon, 11 Dec 2023 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nq/0y8Al"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B52C21112
	for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 09:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E608C433C7;
	Mon, 11 Dec 2023 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702286545;
	bh=loi0HaJE81baXDC9k3d7qgLhOZK98B8aq2E8/2avPlU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nq/0y8AlWIGYezWXJ76icz3Jvp/ul+Q05DOKUcmIkby/D5l8fhQ+qRELJpmOVJR+o
	 WOXX6P3TDZAyEjyw1cb8P7O3Au9ANm1/ZnpUy+oFtLBmtpA7V2pxs7TIQmIpN1YWIE
	 R7cVYqpTpQMStfixab4zoBaZing6LHbAgAiE2yk86Ykiww16bOclT1+lfNSdlqYJYA
	 iSsoj+eS9zCcfAONBqhXU62hhuQds2xuIVV2AQUYXqhTzePdbifVBNOdBAHPM+l34D
	 SXZuVcOSPjeWeqta+PXUA5l5dBmYOsoggy5Vr9tntivBzYeQnoZ4FtEoJKzYdN5cun
	 8t56/rQ7oZB4w==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50bfd3a5b54so4711475e87.3;
        Mon, 11 Dec 2023 01:22:25 -0800 (PST)
X-Gm-Message-State: AOJu0Yy74CCcveT+iVJFtlg4TH13YER0LaXF6J/7e9V8IsPwYzFNjX9w
	RWkIZy4iMqEl8KF5s93Ndg2IK+i5HK5fDbXW2w0=
X-Google-Smtp-Source: AGHT+IHkUug4AGg9NguvDT6U8EQW0DoFEM6O+sS6ukhcM/xO967l6nnD3SzKtlcEynqtqCAzg48Nvq1JutvPDEFQZ0k=
X-Received: by 2002:ac2:4989:0:b0:50c:5c0:b5e0 with SMTP id
 f9-20020ac24989000000b0050c05c0b5e0mr1699083lfl.105.1702286543727; Mon, 11
 Dec 2023 01:22:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211151303.1286eda5@canb.auug.org.au> <20231211153905.6cbf7dcb@canb.auug.org.au>
In-Reply-To: <20231211153905.6cbf7dcb@canb.auug.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 11 Dec 2023 10:22:12 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGG=pPAFEJ=YuWkk6oc7ZZfRE=Y3jGmp-4fWb7FK3AC0g@mail.gmail.com>
Message-ID: <CAMj1kXGG=pPAFEJ=YuWkk6oc7ZZfRE=Y3jGmp-4fWb7FK3AC0g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the efi tree with the efi-fixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Masahisa Kojima <masahisa.kojima@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 05:39, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Mon, 11 Dec 2023 15:13:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the efi tree got a conflict in:
> >
> >   fs/efivarfs/super.c
> >
> > between commits:
> >
> >   0b6d38bdd6f8 ("efivarfs: Free s_fs_info on unmount")
> >   ab5c4251a009 ("efivarfs: Move efivarfs list into superblock s_fs_info")
> >
> > from the efi-fixes tree and commit:
> >
> >   b501d5b36f58 ("efivarfs: automatically update super block flag")
> >
> > from the efi tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
>
> Actually the below is needed. ("info" is not a great name for, even a
> static, global variable.  And maybe what I have called "einfo" could be
> "sfi" like in efivarfs_kill_sb() ...)

Apologies, I should have spotted this myself.

I'll fix this up and sync up the branches so any conflicts are
resolved before they reach you.

