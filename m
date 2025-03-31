Return-Path: <linux-next+bounces-6102-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B726A76098
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 09:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BB273AB113
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 07:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239AE1C84A0;
	Mon, 31 Mar 2025 07:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuUPLgdA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C07F1C1F22;
	Mon, 31 Mar 2025 07:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743407581; cv=none; b=TNvwifs82nuDImF4A115Wu2E5+AVYsiEpVm6A9FLVZf7lBF1c7hecp6wA+Q6qeRdclseQ8Gxxrm15Cmfc/3GjjtiKg3Vb2PmxO9KDGhgdKWiC7tXGxmszggJC3CoiKgZn+GDADKk50wa3oT/mSaSxv4X582Er7yeORCO9C8+TNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743407581; c=relaxed/simple;
	bh=nVsr6h/d6wxlnXYTNX2+zfMFUgOmP7kxOHDWcKbB0O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rEkwK65ACUJJRImVv9KffJXZpzxl1VHA06m3zAD+KFSuzaO/L5jfP4UPwe9gXZXCoDRUSwhNqGYZvNTKmfBJSv7vxu17RNtk1Algx2CbsztYtCyuQXM1lhH5zZLJjVFJ2cWymINdaq1jlyoRUSeLA2JvoGK3gUmGWXyDll5jbHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuUPLgdA; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-301317939a0so951016a91.2;
        Mon, 31 Mar 2025 00:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743407579; x=1744012379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQKkjiuT794y4BQUqltzWiJ7Uf7+ew47mA8K1XybC9s=;
        b=AuUPLgdAjUO48mLcq+pkSqSjoju+t0SUxdBUFms0iUBNqUlxyy7sXReI3zqjGgCXln
         UBlAL8t4Lte535M1yd3MJapF/cHNWyuahAT0WejIZr2x9+PldnXtAEl3STuJeXT+hcYP
         AalIz30/5/BwoERXg2ch4wG4ybRmVyOniM3D0kSuP57dOe2A4tGfriMD41wPJLCR3JNE
         xKaFqcuD5jbgY4micXJZv1a4qY4HmhraV06iZyhjI6RXlV1hhbqVmMOfhulwOYZb8FOf
         eYEiqog8SlbWtlTk2zWrUrFRRh+eYJ84ls+1Y+iJQUOW+Z8bqbOyKW1m9aO1lhIBaZNR
         VKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743407579; x=1744012379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQKkjiuT794y4BQUqltzWiJ7Uf7+ew47mA8K1XybC9s=;
        b=VAkzLvASYu4AhKJ0eum0e+bjh1KUH9YsEk11dPg7NcK+Z+Drw2lv1XRrcrf02EgIvb
         RuV9RzpYuooze61gR+19OT+g0IjeCBKWxnX76eMKYzhCBUexlSlrSk52NwV2xtOF1WAK
         +28VbJIK3jaiZJLvXVwmuHvDrzrBReS3X8DsIIoaY7Y+vLX1qhsri60QIQZBYgz3R6IR
         RJxwixcQ7GNcf5eCFyXIYXp2IX2WI15QHv1hAwVc6KUMYgrgb8FpejNVV84N+Pz2pXUL
         awwPu9n11ClfRz0/u2Bs1v9N3lZDaQtLK+OWYIvSWMulCw6ztWjCuTRM1AykTy29GTT9
         aNyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU9TeBa+IwCAE5hD714Nt5tIjvnf6RbbTxB+Jx8aA+/uduR6rZEd/QSn3IF9vQi4c5jMfPuo1eMd3Ey3Y=@vger.kernel.org, AJvYcCVkTjQnbTvZqXmRUy38jVPklrQ7cXMHTwKvuFhhBq9mnTwTZ+do4SwGqDMomxigwUzhgCJ7SLtXKC/SCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBSEQZxaPi8In79m1Xzz44ZD5Jzl+jpnrHI0cAoBGMig/A9fsw
	DAUB7cagMaoC3qGM4U4rTk8+KUieg7+cD4/MlOlxc+05ptoRgskBL+9i6Ggn4Ws+EQxjXk8eEsp
	dbxmBH0zpqn0IuVnsU2MvKfu0mjXRprg5
X-Gm-Gg: ASbGncvdXRVCU7RK7Y/9JboK3n0O/+hKyltM2AXk9HObZkQ5ORLt45EzqBEheWnaYIA
	NddsRQ4McUkXHOUFzXTmY20pUXVdlpgiItcMnTFcfUFAMzujGO6wC+9t0hSlR0RT3gcHIZgMn+B
	EM81rVez3Xe8QrD5OPIZAsK783Hg==
X-Google-Smtp-Source: AGHT+IExlfy+kCtZtMaJcYDQP5xOqBKVUmeEGNbJM8Eb6hjgi5fuPefp4DGFeV5Xv5oQUNQnx5Z2Lw31XHXWhigW2C0=
X-Received: by 2002:a17:90b:1d11:b0:2fe:a747:935a with SMTP id
 98e67ed59e1d1-3053213f401mr3653033a91.4.1743407578651; Mon, 31 Mar 2025
 00:52:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331160726.4e3d93dd@canb.auug.org.au>
In-Reply-To: <20250331160726.4e3d93dd@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Mar 2025 09:52:45 +0200
X-Gm-Features: AQ5f1JoDIIjMX-klTP4q5jHdGxKVyW3--zvZLHd4NxngTGQHoznPsrL35nSiuD4
Message-ID: <CANiq72=LaRJK22Z6=KppMea_vk-34-UixTtQKFmjW6EFBytfrQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the loongarch tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	WANG Rui <wangrui@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 7:07=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   rust/Makefile
>
> between commit:
>
>   13c23cb4ed09 ("rust: Fix enabling Rust and building with GCC for LoongA=
rch")
>
> from the loongarch tree and commit:
>
>   6b2dab17d6fa ("rust: pass correct target to bindgen on Usermode Linux")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good to me, thanks!

Cheers,
Miguel

