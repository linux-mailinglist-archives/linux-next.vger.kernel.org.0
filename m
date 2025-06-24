Return-Path: <linux-next+bounces-7221-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D343BAE6001
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 10:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E96A19227F4
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 08:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956252797B7;
	Tue, 24 Jun 2025 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dxqf6fyq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23570253950;
	Tue, 24 Jun 2025 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755284; cv=none; b=dzL7ZxNu0q9vezgREMLOQBQbg5ArW32zzk8kOsIStiEjOQblkvyZW+E5fwYhHI0XNVr43eJ2gcaWCcZdkmQjIeIUPO+1O06erfBzbAdHR2fLBhGIA6R4/FyLYw1Ma4fP+pss3Zn3Zhq4xpW4ygAJIfva2ZrtFMusLlf61An2qMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755284; c=relaxed/simple;
	bh=Bl6eH9wUdHc2uoNpPfh5jQE2lIisYdpL/oDDvuK0m8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tur394TUb41K5CdyLzWkm/oDRcol5RPp1ZvmHn69u3jPEHc6dHDxkJUM2K2H+K+Z0V0nwbH8L0MUVmPDUFMAxR7PYaFhl+bVZnQ9MZPOu62lomC9UU8rL+YcYWqCKO/ad8Nu11CVbaTFyNPcbfLeB5/Jc8VvFETnq9hnO6OvQyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dxqf6fyq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235248ba788so3979215ad.0;
        Tue, 24 Jun 2025 01:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750755281; x=1751360081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bl6eH9wUdHc2uoNpPfh5jQE2lIisYdpL/oDDvuK0m8w=;
        b=Dxqf6fyqBB2l8n6E+BgOOwTaAT+dVBEps0JJCRKef2CGl//+tkC8kCBb3ZaNmqszxf
         HbQv8KhNCpGQSZd5HI3+5DK42K9LENvxq+u8SdCBWbbjqgeRAiDwfhqE2tP2/CHC7tOh
         PtX1qtLjQbTvXgp8hzu9oyGtWkcYOVImeM+tWvLxQKj6GCT0JFtWrsFlxlVhlvSI008Y
         ZddAcd10CqxUhz8+QIotgSR5MLtkrrKG0JipInhuX7txoTmQEhE81s6GxFfDEcMeCsXt
         UjWSF+WuLO0tBltGNCscXR7vq7lzk1xKXDCFN7eKtH2SU+ZYl7BncJ8F3p+pU2Q0jvVz
         n5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750755281; x=1751360081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bl6eH9wUdHc2uoNpPfh5jQE2lIisYdpL/oDDvuK0m8w=;
        b=bMKNlPCH3XH1kdecFYIvwex3zsMbDtCUpP+YVqhqu/NHyG0bwJWTevTGXDe6xhCjlz
         kBRVlesKm/y4uLD7vUY+WybKfLBtmktDdrMtpXq6Oy9XAbodOXGHIEFNQYiafoQy6D9F
         M7V94W2p2xG44kGxFCiDvkDtRg5iF1VNzaaqkWeAENLqKejK/GvfcVp0HvohwcHIVpdn
         r+VT7EYlEg5+9Wz+DfLWISwz8WokPfooo6r2baTmomzQszMiEonatjfUAk3N/ItPVOk2
         JM9zmEb5UjdAB5IrM9RgPqCEVbtmPTfS2oO7NT9mp5Z+fMD0lACZb2UuKATEMNGzjmG7
         f81A==
X-Forwarded-Encrypted: i=1; AJvYcCUuLuGUBBRLky76IGij0A7YCeGSzImtJrLVydMDEWU37QBRxzQ5z1gDSwS4zHjs6wfqwCXK/Lh8J3yvmQ==@vger.kernel.org, AJvYcCWE0UzOEheYsob2F2Pk423BD8HmikYei6KV9sFsOd7rBwz4g1Loeis1bumwt2lJ6dw2oasSDOEFvZey324=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCXuoEKwngXQyX2JX+MDdHMdAynxgmjBwuQyM40bwgVW61lKTH
	imq0m6GqpiGjtG50HBy2nOI4QrEqXpSfjeWCBq5prPymTFpG9HzjphNS0UqqMZkRx3O53dC/8M2
	NPTWRISGxW6j/nmXdnBg4WCVoSaURwaU=
X-Gm-Gg: ASbGncusJcN9mn+iFKRcIrQ7Kdlib0T08sZDTT1GuU4SxLLwO5vPRCgkPEZtnTgL/qD
	AjCW2Ld3qcri2raL/wxyTZkt9esujf7k69vlCuGtkETabNRBcnID9i8Jx9/yH8i/DGPNU0f3+b0
	Qhkvr8IsnX5oGfqiDghfvx9+4gd+vvA9CKrydp0MR8Sbk=
X-Google-Smtp-Source: AGHT+IEj3+WVsDT/qy0LWw3vIbV0dRsOLH6ofdJvi/5wTVBaPGj7ScfnOytLEfzcGmyFE6qIIuzIcxLdnmO8YrwoWFM=
X-Received: by 2002:a17:902:d487:b0:231:c9bb:6105 with SMTP id
 d9443c01a7336-237d94bfe5bmr92558575ad.0.1750755280954; Tue, 24 Jun 2025
 01:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624162338.7b4a03bf@canb.auug.org.au>
In-Reply-To: <20250624162338.7b4a03bf@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Jun 2025 10:54:28 +0200
X-Gm-Features: Ac12FXx5bczycx_7hI4db6jGu1yR4Hk2Pu_bIbfienVFKKKJW_5exLtc5FCCPRg
Message-ID: <CANiq72nTVRfbnWA1bxW-u+a1f+PNt=YLUCrG47vdAcdVzGQvgA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the vfs-brauner tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 8:23=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I fixed it up (I used the former change) and can carry the fix as
> necessary.

Looks good to me, thanks!

Cheers,
Miguel

