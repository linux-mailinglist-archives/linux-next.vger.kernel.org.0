Return-Path: <linux-next+bounces-8510-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 344D6BA71AB
	for <lists+linux-next@lfdr.de>; Sun, 28 Sep 2025 16:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09A537A45D5
	for <lists+linux-next@lfdr.de>; Sun, 28 Sep 2025 14:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0341A3164;
	Sun, 28 Sep 2025 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S682uVXe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE72913B284
	for <linux-next@vger.kernel.org>; Sun, 28 Sep 2025 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759070373; cv=none; b=FU4Lat+ZT2aruFKw97Nhy8UjMYf6jhA4k46iWDsF6DbJ/Oh6p8cO4uTUJZeVWE874FaC50qeMgoobu21etjLFmLhmlLkT1sm1yLH0U1bskruAx1YQTKKtaKh6d4XwodUwfuJSTrhNDcxjj/hCEuLI7Yv1pISuv/K2WQ91XuhEk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759070373; c=relaxed/simple;
	bh=7miexSVIY9sXCT+obT1zQ1e0Pd02sjjmXPW7xBDwtGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uiSj/pPZfI4hJcerEUINCtdZO+VhDE/XuaQK4SJMe6t621ZYe++dCWQo4am94x29xz2lGTO++DbSQHMXqrMERyhAQV1PDdJJKsi3t5XCo+cyb9tFNo//ZCDhG/eZn6/pSP6/XChCAH9wQjP7LruuTM+OlXqOt0nVMJaaRk/dwfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S682uVXe; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27eca7297a7so6065605ad.1
        for <linux-next@vger.kernel.org>; Sun, 28 Sep 2025 07:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759070371; x=1759675171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GheiArk7ypVMh1/1PtNPjvR+VE2OgXKMbbYZQv3X8+s=;
        b=S682uVXeMB/CqumVsJ/zhIw6BnfpWhoc1KKvHSBkqihLxPivYkoI2UVsYVPq4bBaI9
         MboNn+6PoW4AMMjxxKq2eKGviWf0E9KNlPeKYdwdPcUvcZU7pHFOfpzN49ppJwq38mWt
         yFcY2QrgLZ+gFJismfdV2muFRSCK6iW5120gRPhOfWP8BEZLNkLn1NPnowRoeG5Itkux
         YC6jUkAaZ7ygysEevjsiebke7avT0bsIx3CtiKm6HlB/dB1AtLERUu7HBjUE4FUfsbZr
         7UMW0wVcHg9B0bC5n0iGeomAuOW3Gex+fyHfEkZXloonmawRGlO9usC2udbOYbEi+zze
         GWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759070371; x=1759675171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GheiArk7ypVMh1/1PtNPjvR+VE2OgXKMbbYZQv3X8+s=;
        b=g9s+7ux9Vqjye2kftt3xo89cGsmSM9fO+dY9UI3Kv6LoE2h2r+t5+gMf3H+OGudXe9
         KXK4a+0hX32kJT7Msd5a67ombDMmvUgi/jy/ECfSgBiHVVbM1lEiyKG2HdM8XTtLXmkj
         N6yNacDt9rKNIShehkg6EvTSFlerDJzxOapPARsSDUVAPHD7/WgLQQFpfRuD0d6P3thx
         T5nejUvXTrPWAk8rW321/B+FswClzcAHeILpeXipsX99h4ZTP/1mZ6Kv3Tm7ZxWX+8Ms
         CfX8usf6ydSW+AwPwSfuDI0EOMkwvzLUHTM8I7LAYobFEtOD+TTla+OpmBvNoQCCAyP+
         DYjA==
X-Forwarded-Encrypted: i=1; AJvYcCVce2cvRy2p9A+D/dLvS3Ed7l5hxqbWW2uj1l8n2s36fBV5FWYk1uQxrBumz6WQ/depqKeWUbqI1Gqh@vger.kernel.org
X-Gm-Message-State: AOJu0YxKX8/R9d7xDwsISk4RgpEhtmbzirEbSkXtPaZB61Yqs2VwTQlv
	FUIMoums9u+gj4JkTotpJlzIl2rQEZIK/8qZbf1qGC4Vz0gCAKbCoDNETAnm6G32Ibvg7vXBfEc
	u5IqXVcZmiG8GSGs0npBdKqeS+MKm9qw=
X-Gm-Gg: ASbGncuvj1BDjsUvTQ9vVaUouwshp1DLuyVGNFWBJE6bcRTW+Qw0xW+oJnGXcn26Wzw
	mQk1Z4oT1Yksl02/Ge2RtODRtD7Xqj6lwUP3HSyDSwiFaFJW/SR+6/TvyWAgdRBnRWFtd4P7kRQ
	cj4tGhoQDZQFTFFEGRFYG00QY71GFmWzDnaJWeT0WuM3T2O6waf3X6ty8vUTb2ERxhuAOiyCba4
	zqT6ZoCB4WV0fjXrZsBwvZcjTkwLBxwDpXVdsl3/PZkxqHTVXm7Wy10koxZ9mvw5wD1UIFlsN4b
	YjFAqR6yX5/C5AnDwzQdUW1k8vMP0blOs1N2
X-Google-Smtp-Source: AGHT+IHYuLoigCXO/IuVYAvcStFqo7zlZrUbxDGRobz0IRwpzlqDn+RVpePg9UTv4hbc9kz3W2vIkL2OT4f38G+Rpk4=
X-Received: by 2002:a17:903:2341:b0:257:3283:b859 with SMTP id
 d9443c01a7336-27ed4a47a07mr85244135ad.9.1759070371229; Sun, 28 Sep 2025
 07:39:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aMlhpIhjbrDR4C8L@sirena.org.uk>
In-Reply-To: <aMlhpIhjbrDR4C8L@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 28 Sep 2025 16:39:18 +0200
X-Gm-Features: AS18NWBnSfhUHigPfGdLGRaT5eXdBPpwwiSWk230N8BH4GkuRtPWn8V78nifa80
Message-ID: <CANiq72=jq50cCg7Xotc_wruGHiwy3CKcCH8D64-F+BEKznUz=Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the drm-rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 3:10=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
>  +use crate::page::AsPageIter;
> + use crate::fmt;

These should be the other way around to pass `rustfmt` (please see diff bel=
ow).

I noticed now that we have cleared the other issues. If it could be
fixed in the merge commit, it would be great, thanks!

Cheers,
Miguel

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 3d38d9bde582d..2cc147a4cb881 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -7,8 +7,8 @@
     layout::ArrayLayout,
     AllocError, Allocator, Box, Flags, NumaNode,
 };
-use crate::page::AsPageIter;
 use crate::fmt;
+use crate::page::AsPageIter;
 use core::{
     borrow::{Borrow, BorrowMut},
     marker::PhantomData,

