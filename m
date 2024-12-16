Return-Path: <linux-next+bounces-4968-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 923509F2E2C
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 11:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 476A91883A09
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 10:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D143C1B6D10;
	Mon, 16 Dec 2024 10:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKUIfDXR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618BAA41;
	Mon, 16 Dec 2024 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734345083; cv=none; b=SHN5QPlhNp9u+OtJ8PKqiUr9KuKn+vCJYZi7aavxQ4DkEQehUFjziDIRrMVbU1rzerw1/IxsRLJMNm7pag5zQHLQbMn0Zqh9Qhk0w7gp8a/JkaMg9O7BsYyZGvwzFMg420gnMYyFFcpLs+6qwu6bAPPB/q9SPmWfHPXzhnsjp0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734345083; c=relaxed/simple;
	bh=d05bZGsIDBz+bWGNCBAD5GvFVO/DoJ9sVfA0O78rFQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zok1xXBDHGuz+6gI1Ih2sheiucmsQFRb/Krn3IdR+2EU5hccR6i1qGz6T3+24cF9fGaKzU0+8hp8igWPlwd7rCDJoaC+9PCEUwLdzDXjjZQ1DsZh56S87foFr98bElTde0HuXHIEogAvjDABOs2i8o+/QPV10cv/d5Q1ayQPsl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKUIfDXR; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee6d0a57acso423811a91.1;
        Mon, 16 Dec 2024 02:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734345082; x=1734949882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0Y1gEL5pKnsD/l19bCFpUiBOCWO+9VOonMM92YkY7o=;
        b=VKUIfDXRn2QtzYJ1GnHVxubyRXONzyM1UlGrMSBx6s17RIEY12Awo83eopSp5gKGMU
         PPB9Eq8KAW4dPDUEniYAe+WhKZ1HpwhLuNZ1X1B2NG143+sgmKqo/sY6sblG7f9OmBQk
         mGPbrTLPLzQeyc5nBUuUTcXP6mRp4Gac5vOcbzaphQcIdT7S6Z4tZfoy2Msh40q0ohID
         YF1cx/L2idoz+e6wbiW/sfcYnzq8AM3j243WjND2QkO6FpHyY10lrlzmHZoKWKwzwCk8
         bXzckBB9sjLPnQk8vevEzSBhRffBPaVTJR++UtJlKPQraauZAxgqIf0JRnVaNPJ3T14c
         KsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734345082; x=1734949882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0Y1gEL5pKnsD/l19bCFpUiBOCWO+9VOonMM92YkY7o=;
        b=XBhaUOcZ3gf5Qu6S+GQvHLbgfy8sRfKe3ddbh12sPmOWOcxFKR/t5qi9tKB5a7pMSD
         WKfFowMvXN0itX1kltPpdqitEJDCt4gSwCqOKCACocv0jqRAYWhPF6yg9MrMaxH2sTEm
         NWRW3bHcDxQxoufciMFi5/ZYaQ+OvPWWXsZBLraWxHknl/BP/qCBdT4JC9KgXtjNNfZP
         YRORoo9CHr15V2mRaZhMmzkk/BiTaYRYGvyKiwj+UU4r0/v+GsM2YauIlcyFOL1R0AsB
         ZQMY7yMhXRTRCBmjgN4Tir9B4QyIpNK1KyUJHcbuPVraHnmCxiT8ZOdnB5IW0E+7+2Cb
         +iZw==
X-Forwarded-Encrypted: i=1; AJvYcCVve1g8EyTdZQJmVq6l7pvmCUjlghbeBBU1kohrLbVDGL9aKRSEgMLfDKwpXuJ/aeCBMsSI4KsldC8Tkw==@vger.kernel.org, AJvYcCWSs03DSd4w+KftqejPW91ngyfjpzVkFbvH+59PD/gXyl13GvhY6mgPpipejiObUYbNkrX8sSWgVZRS2Go=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7VIrhV5xVYlTyq0vh8T04Y/qKDs3NT32aHzezFPT/9pKyYSFK
	Nht/4KUNx0ajYGHRZHljM/ZJJuvK72FCHlH5pBRSxR7Y7psgzuZC5ndZckYN4jHnA/h3h0QWUwe
	AU4slonJmh5796HbNsqONN+sTp28tCj2xS9k=
X-Gm-Gg: ASbGncvYJdoul8La7E+MZ81nj2D4f0shEU7vkZ+TWm1YlFirxUXUbXqoPl0zaUxdnko
	BrfDHiWkqh8UpbDw/w32gAk47DQoYVy5Ft1j64Q==
X-Google-Smtp-Source: AGHT+IFh68EReS+hFIr/GB0xTg2bYMoSTewqtgRYu+0xg6FG50x4wwAYS4YEEDcd5tISNjUVpTPHxIURF3jxR6N+gQk=
X-Received: by 2002:a17:90b:1a85:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-2f28fb605aamr6813303a91.3.1734345081700; Mon, 16 Dec 2024
 02:31:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216162512.064724b9@canb.auug.org.au>
In-Reply-To: <20241216162512.064724b9@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Dec 2024 11:31:09 +0100
Message-ID: <CANiq72kv-bjeHtnom2xLqMD92xfogd1hm6yFGg16wpqjhJWMGw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jocelyn Falempe <jfalempe@redhat.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 6:25=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> After merging the rust tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

Apologies, fixed now, thanks!

Jocelyn: we are performing the remapping via the new `ffi` crate in
this cycle. I had to add a change to `drm_panic_qr.rs` to take
`c_char` instead of `i8` in `drm_panic_qr_generate`, so that types
match both before and after the remapping. I think this signature
would have been better anyway, but please let me know if you disagree!

    https://github.com/Rust-for-Linux/linux/commit/e1157aee5f038c2c91af269c=
d48653133e99f3fb

(Diff copied below too)

Thanks!

Cheers,
Miguel

[1]

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr=
.rs
index ef2d490965ba..bcf248f69252 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -931,7 +931,7 @@ fn draw_all(&mut self, data: impl Iterator<Item =3D u8>=
) {
 /// They must remain valid for the duration of the function call.
 #[no_mangle]
 pub unsafe extern "C" fn drm_panic_qr_generate(
-    url: *const i8,
+    url: *const kernel::ffi::c_char,
     data: *mut u8,
     data_len: usize,
     data_size: usize,

