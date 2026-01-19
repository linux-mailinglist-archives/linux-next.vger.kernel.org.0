Return-Path: <linux-next+bounces-9715-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5DED3B565
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 19:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 846BB305E364
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 18:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D422BEFEB;
	Mon, 19 Jan 2026 18:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcbCWRrR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D59218AAB
	for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 18:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768846728; cv=pass; b=qwQexV/c+engYWyuj8wBBKkI27TxbJa/dYPGvfxll+S/bC0Aevg8EotSRCupKMCVmTw3AeH6GM6W+c6cKF9AzJABbA/cMZdaBIsBWpb5wLCDQRFX1fSAu6MOVKQZLTJmdfvEGeenrxXPuny1oKDs9iG1dYw+UiHCa0s18eZteQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768846728; c=relaxed/simple;
	bh=S7QYILs7Ukapbl8xvW6yp1JD+qbAnO2iSQz+gu3ar+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/8xL5tR6Dq+NbiQ0ZHyZctWgh3E4oqho06WqTkhcCtFtyYtCTvXuOGzS925BcFQIeV50rUCFHTjUU/eShaNJaUoTJ4aja2gk+cU3c9H/Zpb5PjQBuLmYqoMlBHp4qMT4RLuDOLGCxXmc6EAwaxNaqE5htBUH6fVeqEXw2Hs068=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcbCWRrR; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-382fd8aaa6eso41804431fa.1
        for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 10:18:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768846725; cv=none;
        d=google.com; s=arc-20240605;
        b=QkFCJZki4KutWENUAQb02CWTrYFtJl/nDjRebH110WWlvLRG2MVh5uVMGh5p8tk8L7
         LZRlyB7q5O0w9LPErM57CKCTK64VV4RlY8i9ktelBUm7XKNegeyWO3qQ1NI7EqxOlgQD
         lBmmHLdQiou16btTcY/vaOLWNihBKjpyPcVLYK06LfGVBAFvaYMM3IosM4Puiap3cHsS
         ksgYJoXDFsJk1ntmLGJxQY0CoIDAmbBI7mS3cOUE1CUVj0x5bn3DAGbl3eYQVyzXYOVw
         Hj6+gQ1ixM2tg6hDzPMXjP9vjBY3jORXez9ljZ/D07KwBht+YpHaHXOCNfq+r4B8fMM5
         nnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eDRwgnqkCJgkf2SIVs7EYEtSBYNgt3Ob1eVFdFvJmeE=;
        fh=CvVja23DxKzbl8DQ90K+QFGqFU6npIwPqd2jEijhxcE=;
        b=iW4WFmfP5TgoRW8jrOp/5Np4kiOUYu44j4+8JoxkiW5Ml1H6nH5WKxnP4GOgoRys/P
         Y9zf/YCLOLrPnpKMGpCsCu74cpBQLnjU9HHdLFrHr+763em1ZyTJ1X0bcRJj138Mx86p
         rdkiNtDGpkOWjkDDgTJBN3D5RW8xAK7xL4CP6ADzx/eyADrsweduHbUDEBtNlfdu7LS2
         Tzrlzom24qqtZwK/HnO9MoaVcRUCAtj0EjBlZIGq8hYFyAdLA7bQOQjKjnHqMtvWpqTG
         7B4ldokD9z9CR4lrWHDlcEgNpWqE/00849iggY2vW+0Rw7pzV619wRu9S+Svs6BKRIVS
         EopA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768846725; x=1769451525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDRwgnqkCJgkf2SIVs7EYEtSBYNgt3Ob1eVFdFvJmeE=;
        b=PcbCWRrRvmPCiT00tJM/+LUr12OrY41ZTTOTAZAxoW5oqYImwe2zgMc6XZ/LIHiSHs
         rjVlU0MENMwWGTFHyjKxZrqOTducf23pOSEOygqp8Enx70wyvEZ95UinnFIgbgcVLIvg
         9pyPacdV3CR5gmkR/CDW79tlXb+oU8HU4DYIeVDmri2ad+mFu2SBFOfxsuJ0OlWh0W/F
         wcNU22bgnsMXReGKcXuL/Ry7kwbDBx/YQobZs2SIRp1u8tLDUkje923KpPmXiPLzjkJF
         aVFWR1m2Wcy9SI5miXo602V47mb0P636WBgOTKPEW8uCXm14mzxYDDaW0Yb8WhG3Wmvm
         wxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768846725; x=1769451525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eDRwgnqkCJgkf2SIVs7EYEtSBYNgt3Ob1eVFdFvJmeE=;
        b=o47O67UHY02u/vdzfrKazdugvgwCxEQA+6/j5UVfsKBGhjsZTnanJRweFBc6jnGMhO
         wycxguZR4WS9jwSLy+bn5j5xmiAnvuWPT5mumd+/195us4xMtxydeDVOHB1Z9iEHLQ8j
         dWEJN8eNXDt4aQk87q7nwBnI9I8/mn5Y+ApGkZgCS7KLJBG830jMWh0xQGkwb7RGOuGo
         BelOfKuKRBFIvBMqYJ5a5bzWjfxWkwSMT+IAUB5vot04jyXdfTMVRTqHIhwqgb3/GmId
         AP4ezZLzjuE5h0o3ceT/hsEYvRrEtxGAN+zbIZyM9dtxJNprX2FpRdHnL5jEDnU7mqOA
         OUPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt6LdUqMLFVAFhJav2GS70JVRmuKz9pP+hcy6cdqBmPNRrz5kw+e2X2N2h09aZxuPfybkaznPeIK3P@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6gJLST/1VmBpRIrx6MaL+t52tZ4c0TzeAZCay4CbOtGkCSI0Q
	EASrNktL7Ok2Uy5iq1mJ0FgKtVzP+w+kmiiEjA8eLnELX37Ae4ZBujmXM9i90QM7L96n6K64ndz
	Pad8FZE1wX+Buoks+mBjgl9eHh6SabGw=
X-Gm-Gg: AY/fxX6z96tWnPBfs6YO2KZhZDvqK4pRqV/Tj0GCh0xVub4v70ZWkJGaJkDT9sD8ZLd
	3eELC+1DT1QRpG7ZB7HWLPY97iozIZvETo9kHqqzawFbBGrNcOh6JXhFEDx+RnGQcTykB2s8xpk
	B8D4t9LfpoDx4+0mNuYmYK3N2WPJbDUBkTnV7Ek8z1AH00iImebKi0q0qwMvJ7xK9SuepIf5l61
	G7vxvpHuBTROyv4f6antAaMFeYNYheUu+vsdUQiF4fmixvujxIP3yV4ovARKyGGV/tjymPnI/+5
	9RSKfT2CbBYzvlE4J6X4NsS6RFuBXQKyh2WUJX4FnjxSCzUi+Cb4U3q1Nf2y7FrP6UIrTFNQKPL
	mUmzCpZCcIDyJerWSw1HSyoYP9m1ZQwuV/ZN6oMZ+mQ==
X-Received: by 2002:a05:651c:985:b0:37b:97b7:a048 with SMTP id
 38308e7fff4ca-383841b546emr48876181fa.17.1768846725132; Mon, 19 Jan 2026
 10:18:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aW5xqLq7gatOy1DV@sirena.org.uk> <fc855e76-5f3a-458e-82f9-f43c7d23932e@sirena.org.uk>
In-Reply-To: <fc855e76-5f3a-458e-82f9-f43c7d23932e@sirena.org.uk>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 19 Jan 2026 13:18:09 -0500
X-Gm-Features: AZwV_Qhc_8l8-PqDP0lP7BLMUIAF8h6RJKfxU_5cld04yjk5njUVIvjEx7EpnB0
Message-ID: <CAJ-ks9=V_JmzEaXUrHPm6K-DyTgkxEhrPCW=2ZgDJpc+4Z83_A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the block tree
To: Mark Brown <broonie@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 1:13=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Jan 19, 2026 at 06:02:20PM +0000, Mark Brown wrote:
>
> > Caused by commit
>
> >   4cef2fcda3ada (rnull: replace `kernel::c_str!` with C-Strings)
>
> > I have used the version from 20260116 instead.
>
> Actually that's been there for a while so I'll just revert the commit
> instead.

Ah yes, this is the combination of
https://lore.kernel.org/all/20251222-cstr-configfs-v1-1-cc1665c51c43@gmail.=
com/
and https://lore.kernel.org/all/20251222-cstr-block-v1-1-fdab28bb7367@gmail=
.com/
going through different trees. With both changes, the import becomes
unused. Can the import be removed as part of the merge commit?

