Return-Path: <linux-next+bounces-7237-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAD4AE64F8
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 14:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78FE5400845
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 12:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDAB291C1F;
	Tue, 24 Jun 2025 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGVrS2FN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731922882A1;
	Tue, 24 Jun 2025 12:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768181; cv=none; b=cO+PQvReh01QljC1dhYz/PfvXm9aUpj2Ecov4DFBmurD1ctues55qpA4G4GcB6c4TWSrFguIR7/ITkcK0UMCjRXFSBDxH8Q7QNuxDwZ1jlNu4oy598RwXstObs+SarKUAvXgivzRAIvfW1opsAKDNVPIeN3rmS5QhAjAMb/4/eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768181; c=relaxed/simple;
	bh=h5Xjx548KBGhb+QH3awd/insn5YXvcxsJDa7XK5bT/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvC75XUA7MupeHQrKg0lBxnJZEHeQLaeZAyfQxiKmTHa1gJOX5QilHBvDd9mtqRjTAcO6z0q/JxFwzqAVVrm5N9sHTGbGywsxwLOzvXp7dOp1L4kk03Pt8kVb+hk/QPAR3suIMWOUhP8+UUBJ9JKbp62B4ZFCKVKMRRaOxG+zi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGVrS2FN; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-313290ea247so947844a91.3;
        Tue, 24 Jun 2025 05:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750768180; x=1751372980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58IdTTm1KDXDTBgD7yLB+k4Hv48ffDiHVTMDGupVztY=;
        b=lGVrS2FN12VOf8XpzgnM2mxT7pMDobxSDoR19mAZypcjz1q98nb8cg41U5Zo4dWWbx
         7EmwBTutx3FvtyC022uwm7jOpomK2ehoe3pxC8Y0BPM+Kd+jXl1O4+XbmMRlI5ARqKUz
         aTon/0/2OL82MAzOq22HGa5u3nwN7bWONz8WkODDIzbeojBbdzBYuot8zdBbGCLsjD7V
         Mkwtwb5gMPzJlBS/d8JKVsY2uzM9G4YC13njVZOLkM+MLk2/uT7EH4RHAZlgmtETbBfM
         zvjb5SLXiBMUdFUjMVZyYykOVoEOtIzIPgGBRJhr1rcsf2huFjIGVUNC9DU31xWZKAGl
         ZaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750768180; x=1751372980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58IdTTm1KDXDTBgD7yLB+k4Hv48ffDiHVTMDGupVztY=;
        b=WoOxhb89K38fajN9kbGjdMV0OPaTO5izERstvpk8UmNxCXmy51YghNIY5DgjzemF1Y
         2k1J2oTar476Y+PYM+x0U803+RGExn8d3s4t9uXkNJVS+UU6Tv7AQL3uzVoIVq4gVlhQ
         oOGXnjMYNxfcddxV4QKYa1ck8gbHHPoDHN9EP+U6C4DSQ1huIDAilU/uLANPo7L9WV/r
         2bthCSSf4Hyxb11RYs7bAsj9EHN9dMbl4FihIdIFm+77oY9aL9TKhuPE/cjhyV9BeEpb
         Y64hT4efoHxF6o/POS693E+5uIUf47C/bR6EgXbnUPYc4YwhsMBYRY40w/6HloI6hWXX
         jykA==
X-Forwarded-Encrypted: i=1; AJvYcCUbhQAdmeOs5eyDViRDWX911eRZw7N4ezbTCA20miJxUgydfgz/P0MVFj3Bo7gEyQ/zTbCfHl3B89GbtcM=@vger.kernel.org, AJvYcCVmPFt4DMP5G/us4cCDX0HMmshaRz/nAdjko1CjFkkrLTHeVEumYfNYedehr6qcVXGLsc9+17jRmo5PmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC65b/k+1QKFLz5tzJMaDAywNj97Sa/QLxAO4VUCYhfRSd9lQ2
	bjbK5VCL8jcMdG9qqYiQc5IwA9OphJdfaqZhcKkibkLw6k9IxD2eAKH0/rGbXw8B3RBm1K0JRbv
	vV2+NqGoOFlRtCWGv2NN7cdZXOOJohqc=
X-Gm-Gg: ASbGnctsUb3/NJ8HFoO0dXdhpAtNTkA24HB3HqXnWz83ka4+6OrhA51iJiMZGQrpCJD
	IbnCo4maflidMpsQbgISNsDg3uLiw17TD1yQZ752Z4DhkJEGw3tYCL5OoypQTpYs/V8OpZKhUbO
	EPqnKztt6+cuq+OyDzm3IlA6LUgY02wF1jjawYqxuFJmU=
X-Google-Smtp-Source: AGHT+IFrfuWvnBBPoyRQXiiDiCQCSVdOdCBz4ctn/6d4vo6QAB//JQLLrK8M+4hvH+OoZcrSmH3Yu7ImH5bXLy2KvJ0=
X-Received: by 2002:a17:90a:d64f:b0:312:1ae9:1537 with SMTP id
 98e67ed59e1d1-3159d577d0cmr7959956a91.0.1750768179753; Tue, 24 Jun 2025
 05:29:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624173114.3be38990@canb.auug.org.au> <CANiq72=nLeuw030T16-vDZT4A_gNyPm7WuXoK_3nFo0h0-eKJQ@mail.gmail.com>
 <aFqIJ6aN_iqEPGAR@pollux>
In-Reply-To: <aFqIJ6aN_iqEPGAR@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Jun 2025 14:29:26 +0200
X-Gm-Features: Ac12FXxbwJy7FU1k9gzdMd_bY2BYiBWc7BsRSXY_fb5wF0gffMwrUxTJrxWxbhU
Message-ID: <CANiq72mcrx04KWzq45cVyC152WTt0jF2=+msc-qmhvRz8vERLQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Danilo Krummrich <dakr@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alexandre Courbot <acourbot@nvidia.com>, 
	Lyude Paul <lyude@redhat.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 1:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> How do I get this warning to trigger? I did run my usual tests with rustc=
 1.78
> and 1.87.

Ah, sorry, my bad -- it is in the upcoming 1.88, which I was using for
something else.

You can test it with:

    RUSTUP_DIST_SERVER=3Dhttps://dev-static.rust-lang.org rustup update sta=
ble

Cheers,
Miguel

