Return-Path: <linux-next+bounces-9108-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3313FC7312D
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 10:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 9D7232A573
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 09:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0D7303CB2;
	Thu, 20 Nov 2025 09:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaYarxW/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346AE2F066A
	for <linux-next@vger.kernel.org>; Thu, 20 Nov 2025 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630128; cv=none; b=EdcoWf+77shSjFu99RrGj8o0hJ3DpZ5rDRRiETkDMMh86QlRtr0YACQzxVcH4Ud35wrUz15CVXgzik9Vtddi/ISdynlgkB6Y/W54Z+Guijx6n5cniZwQocQiPBbTcfwje27DiduWMeHcqhrqEHXOI8NK9tsURGNt9YtCNSuV4uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630128; c=relaxed/simple;
	bh=TLzvaRNHZXYH9DPSXKmLYT5tfZKuDD7qZm5TgE8Vw4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4RWchZCZNQWZT81SeZxUnEE6eoaC7i9f1ZrvQWhePoQfcUuGNFhsyYgDIj0EVGxlH3KbeBhQHff0r66Xo/Gh69dO8sd3YESNPBKXD4IHL42oBPryyVxQz4/qlAS5fCIX/xDVafBKQsLJOkqJNMCtIZZcD5q1ur5hEB2zYpKgVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaYarxW/; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bd5cf88d165so26075a12.1
        for <linux-next@vger.kernel.org>; Thu, 20 Nov 2025 01:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763630125; x=1764234925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8dBJvYD2wIMt4h1SWnzk2W9xsRTPxrVkLsHVBvVwN8=;
        b=iaYarxW/nH/q8LEvDFwlpsKcSnixylSYhX/R54ePaqVtUKCBEomybnBLRIQ6e0xwsO
         2Z18jKM+QRPvXAoO5XrLl8NNhXnOOJ+byoB7Ju4JGtS9wDAbLLX7zGCcMnEJFQTweVji
         9rzJSlb3JtDnjYtYt5hlZ1uSRN1+hMRWutUYZN+BvHNu0nyeD3u+WCvHapvZePQREGjE
         BEoxAApkWI9HQURXwxn8ITqfnzoyiC934Nr5Sv0n5CLd+NTRO23b23fEMKT3f89+F5/p
         2a/F1ZlAtGRTfhMQM3uxW55BpYeffajWOpBRVF1rGUFKGrsAQTFYZ0g3PsaljMSKRAlS
         st6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630125; x=1764234925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/8dBJvYD2wIMt4h1SWnzk2W9xsRTPxrVkLsHVBvVwN8=;
        b=AWNxAjaFtlbf7Ary/7r1DXhvFCR5G+OdBENhZWlMTLJ6XK8PZ2wggORG41jjoHLbwH
         xhravC8lUXE6yX+SiUxd/EEcb9hVCgyDDhjLbgBV9YTZZDrxTpTa2+rlDGcKUhxwCeM8
         YxH9IuxfOSdIURmgML7SKKj6J18h3BYm5/qdjOQQDOJUxJhmEbfa/YqxBvMZVUR+RjyZ
         mTwwEZNwDjkhkp3p8dgABMjQ3bT3aQCxr6jqABg76NGsCtRD2R17l3XG8Jy+qhugD3ZK
         4/TNVmKuR5SidupVeTdxbgGWHTH7q6Gtvrg2BHHwajed0sN7RDs5FhbZrSAAciopUwWf
         8UTg==
X-Forwarded-Encrypted: i=1; AJvYcCU2TsjMV1I2z+Af7dPwCv7scDJKfSAEEwUmEHYdFl6f3QsDuFn5to69mWRtuC8HZVXhekVb9fba2ERw@vger.kernel.org
X-Gm-Message-State: AOJu0YyfNBw/0pXdpwZKxQnH9AuLAPpRLNynvtiMPfmNNZLPXRyBN00/
	gmsWS4wbG2ON6yQARa5BWqvC5Tijaql7cp7sgkqHTSqtQIJ18nt5Ezzm+AewGcPDI+pY0zWd2S9
	sgKYPb2RDFpN+fhYa1ETJxbz6uy3dqYg=
X-Gm-Gg: ASbGnctTaqv1n8Rw24fMHAFGY9fL2xETPQi4efdWeq+N5EXnoOK8kyRmy4UiF6nB8w/
	/tszmPp3OcmmsUqeZuJFuoYUSfqhdjRdAlXsa7WlK0BjYfrOHs6UnjZkTfdMXPJ3JjPHF+ur+mP
	D1wQ4PkBx2iyGCpnE13SWwWHQzJ31sJrniuYTKqgLopmAkcjOfpp152TEUe5C0TB68WaaiLPWMG
	7HsuebbqDRJeK5BPC+Yqpn5lciolvvNVTo9eBGIjqakYNYbPX6XGM9NHzqp86OQPmaAEkIsKtUP
	K/2mXQVeECB4iMo6/vqLVzeFU+sFZwiEHY7VVyUuhw4TXFJdpfwWO4lXBdUnyJlSRJgahlrgnZL
	/Cy8/KKM228PwjA==
X-Google-Smtp-Source: AGHT+IHxtnWGYsm3LFZRczC9zdV1e3SVuSzqd5lCkRCtCSwSHSKCUy+mu2VyX3bSoeSnixHqgQjf0c+qJNqElhf3Sas=
X-Received: by 2002:a05:7301:608a:b0:2a4:3592:8623 with SMTP id
 5a478bee46e88-2a6fd00454dmr966928eec.1.1763630124979; Thu, 20 Nov 2025
 01:15:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120181111.65ce75a0@canb.auug.org.au>
In-Reply-To: <20251120181111.65ce75a0@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 20 Nov 2025 10:15:12 +0100
X-Gm-Features: AWmQ_bmx27fy-6GltfjUArDrYggtl_znIUPsOrpU7bqfecOHmOPCKoWR3rYCaWc
Message-ID: <CANiq72mW=zMbt2W2Omn4PnMDDJfqz3tDtrneMOFz2ysQ34T8zg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 8:11=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I have applied the following (hack) merge resolution for today.

Thanks a lot Stephen for taking the time to do that instead of dropping it.

We should be able to do the same as Tamir did in commit 657403637f7d
("rust: acpi: use `core::ffi::CStr` method names"), i.e. move the
build assert below to then be able to use `len()` instead:

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index aea1b44d189b..f67c355c988e 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -43,11 +43,8 @@ impl DeviceId {
     /// Create a new device id from an I2C 'id' string.
     #[inline(always)]
     pub const fn new(id: &'static CStr) -> Self {
-        build_assert!(
-            id.len_with_nul() <=3D Self::I2C_NAME_SIZE,
-            "ID exceeds 20 bytes"
-        );
-        let src =3D id.as_bytes_with_nul();
+        let src =3D id.to_bytes_with_nul();
+        build_assert!(src.len() <=3D Self::I2C_NAME_SIZE, "ID exceeds 20 b=
ytes");
         let mut i2c: bindings::i2c_device_id =3D pin_init::zeroed();
         let mut i =3D 0;
         while i < src.len() {
@@ -433,11 +430,8 @@ impl I2cBoardInfo {
     /// Create a new [`I2cBoardInfo`] for a kernel driver.
     #[inline(always)]
     pub const fn new(type_: &'static CStr, addr: u16) -> Self {
-        build_assert!(
-            type_.len_with_nul() <=3D Self::I2C_TYPE_SIZE,
-            "Type exceeds 20 bytes"
-        );
-        let src =3D type_.as_bytes_with_nul();
+        let src =3D type_.to_bytes_with_nul();
+        build_assert!(src.len() <=3D Self::I2C_TYPE_SIZE, "Type exceeds
20 bytes");
         let mut i2c_board_info: bindings::i2c_board_info =3D pin_init::zer=
oed();
         let mut i: usize =3D 0;
         while i < src.len() {

Igor/Tamir?

Cheers,
Miguel

