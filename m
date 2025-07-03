Return-Path: <linux-next+bounces-7344-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D18AF8476
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 01:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87C355439C2
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 23:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6C12BEC20;
	Thu,  3 Jul 2025 23:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VyOe8Oyb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BD823E23C;
	Thu,  3 Jul 2025 23:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751586442; cv=none; b=LasW0wGU54Mr1h0gHMy6IyVDj3BjXWLIBN8WIKGRHv2XKabuYbkgXPamBvqi4T8wTgfGdy+h3Ar2MpX+cIPkVYt4s26oNGqk+NBsgVz/KiPLXtsD4c+WxWuz1gKAW6fiiOy2jqkiz3VPAbQMpOSn5ZVqyfiZgxhugRYlLO143SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751586442; c=relaxed/simple;
	bh=ga5lXAmOfzr8qoFLiMRpwuhprlQ+GSnRSQn6xJ63Cxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FgMcJACmJ7RyLEwExVC0R3NW7BiangTYPjwGe/65DXniOdJyf12ss/SzQjwYxQSR5nwccpDu4JP7x4Plg5cXspPyEo8YLxd/S6JA5hj+LOTtaW6H/+AkSRCd21ccjWX8Zr2/cSuHZsi7vgyMDLCy5Ag+dBgOLOrbraMS1RFHgew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VyOe8Oyb; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-701046cfeefso7979106d6.2;
        Thu, 03 Jul 2025 16:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751586437; x=1752191237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLIL3/Ux09fpL7/ZZ7enwXyp/uTFzedzuYlNNIkAKmw=;
        b=VyOe8Oybqx5AkW8SokbAqR7TkesxuJvL+fcL7pC4gPpM/98XCOeGLnlyJIdb64Aanp
         v6/sUNHY5V0oWYf6wwK4mF2xtWvINmTDvyGXy+kKSBVO3S8B3YxMW2Czoy9f4uvPCM5B
         qQwj+mL6bzgeSWNM8dE6FoqfdaGlSdDYhb/JMnPG6l7/bpl+TIgbQRQPC9Oy9RwvxvDE
         NBS5lXwAyZtr+StXfhdWjcTokFZ+Jmfls8PMVz1R7bc4j76AVJmuRBpmmINxiPielaU0
         1P7MK8qA4SuSmYXfnQ3nphH4HbYEISSIn97rG4l0cVZxFfpiNopwSvHAbD4f3ef6SuSq
         2NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751586437; x=1752191237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLIL3/Ux09fpL7/ZZ7enwXyp/uTFzedzuYlNNIkAKmw=;
        b=iIjzZwyMR9z05/p01U7AiBnIZtUOmMupbQK3rXbKMNpt835VPFmNeOcB4xBm+uAFNN
         HvL+BeBB6H7VfMjLG6VoHCxe+jMHodx3NvkX5eOpMsMwLMzgtTaVywnwIzjdQQmnfLR9
         dwVZoMHygAQgq7cL1SWZgoBXI4TVxx5JXNCONFBsTIoi2GrGFoRDgnO5C9aHZK6w1L9/
         LA4oAGuByXf75Tcc/QHtrdyyxixDho7kDRSpgvstk0PEpyb8NGx8R2OWdeJdTgtb7bYQ
         y9TKLNPETo7+qJA5021a4OSTGKz9nCqpY9gtU6pPmhvG6szc2PRj+lO6hSsAwzpN+chv
         0gQg==
X-Forwarded-Encrypted: i=1; AJvYcCWY7t1rFbARR84QxFJHj3Ayn8NU6edllpnERUs/1S46PeMefAJWlZTaiEdH08XCC95vbcVpQYHRnZqz@vger.kernel.org, AJvYcCWdtca3Zjj5Wf4ufyFAdh7Q8HEYn8fUkyXVTD4yJidVxmtaVSRcPJFieBydDLYSYhs1bY/fb1qAHY8J9g==@vger.kernel.org, AJvYcCXXaVZpBcIMFHHLk1Hcen5Y3oDJeXfvGFKQ1oi7P8waMwCeelGDSaRtd35dF24e8nxgBXOZoUfOjtNiF2Hh@vger.kernel.org
X-Gm-Message-State: AOJu0YxpMZ5Vi+7H19mC7VxJPgoKROoSAZ+ensKDkL9tLdRwKpE0Itqm
	1l/+FHdxK6ie178vcwYG+0i9tUmbKlxQpYpjo3z48ugW7UJAiHt4yVX1DwUtogtt+SP2wQkNqGV
	M3AjXMcFdhc9fDV8IAZv847d1sAnq3wc=
X-Gm-Gg: ASbGncszPthqWEiCyH4+AeCCExCcnm22ZXCG5AJWrtvilxorNHwUrxRfj2vTN/Lq/1T
	VeKBJWES+AMZB0QTR5OiK9agt4Dr3/Vj/T1XFCcFml5B097q/doD7p3g7L4kCUrD1bz+TuIPoGp
	OS9oKxm8agPerfSVxZsq9aPz1Llw3i7ClqFb0zBr1hlCMZdtRnauawnOl2Ow9VaNaLBeRboiC0D
	lpQ9g==
X-Google-Smtp-Source: AGHT+IFJ8i59RX9o6nUtArcwP5MLck456ZtZUPcJJR1fIuwYynkz4sO7gDtGy4SWdC5Xmp97SrO3F3Kgwr47kO0PySQ=
X-Received: by 2002:a05:6214:1242:b0:702:c03f:c409 with SMTP id
 6a1803df08f44-702c6a5cd5bmr4745976d6.0.1751586436973; Thu, 03 Jul 2025
 16:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704082645.37b267dd@canb.auug.org.au>
In-Reply-To: <20250704082645.37b267dd@canb.auug.org.au>
From: Steve French <smfrench@gmail.com>
Date: Thu, 3 Jul 2025 18:47:05 -0500
X-Gm-Features: Ac12FXyY_9waV6qthjXtaFUCn1GT3nDII1Pot0e_062gFHHmm4hp5NOoawpmrzs
Message-ID: <CAH2r5msMEgi9PfeeesWWxGBXOUpDVhDzbPD+b+r_hQDLS_-zRQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the cifs tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wang Zhaolong <wangzhaolong@huaweicloud.com>, CIFS <linux-cifs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Paulo Alcantara <pc@manguebit.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

good catch.

Corrected the Fixes tag and updated cifs-2.6.git for-next

On Thu, Jul 3, 2025 at 5:26=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> In commit
>
>   2799c0ada68c ("smb: client: fix race condition in negotiate timeout by =
using more precise timing")
>
> Fixes tag
>
>   Fixes: 515ccdbe9b2f ("[Backport] smb: client: fix hang in wait_for_resp=
onse() for negproto")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: 7ccc1465465d ("smb: client: fix hang in wait_for_response() for ne=
gproto")
>
> --
> Cheers,
> Stephen Rothwell



--=20
Thanks,

Steve

