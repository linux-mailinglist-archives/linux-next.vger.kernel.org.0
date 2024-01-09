Return-Path: <linux-next+bounces-702-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DEA828F82
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 23:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB07B2885D5
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 22:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341643C6A4;
	Tue,  9 Jan 2024 22:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVsVdMvG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39533DB98
	for <linux-next@vger.kernel.org>; Tue,  9 Jan 2024 22:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40d87df95ddso36543985e9.0
        for <linux-next@vger.kernel.org>; Tue, 09 Jan 2024 14:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704838573; x=1705443373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MixBUBxVsBGX2GWEWX3K+n4VoV5LO1ISSw5Nn8Xv6uU=;
        b=OVsVdMvGIZfS6BUUHTKk6Ao4BpsogsOaJQT8pGS0DHWBgzJ9XcTbuAdp7yNCggVf8X
         +scRXJONlIFlsj9Eu/armaA8WifDRZQ5nXGBdl4NahlvFJl+2B4jAYqeMJ3+vRWPDnFh
         HKuUJMLEElLr+lmQxTMXelDnBnUMFX/BLCJf908UMKfr1k+IFRkC0ttbeYL/NaHTWB6F
         DlnoXwPW0yqtzpPxZ/VCsmWDS5IoKS8BhZ0gtkUMaZegrqwssr5Xx/cFB40Wr8KGKRdu
         KkTR7sMWLqIgyr0uR+PMMWvkXKT5PaU2Mlhio1iu+IMd7RWndj/+8tfByaMxLU7c5peB
         kpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704838573; x=1705443373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MixBUBxVsBGX2GWEWX3K+n4VoV5LO1ISSw5Nn8Xv6uU=;
        b=SqxdRrfxrSBfM2drLuC8yz9hjVaU8szq5esL6vPsusRhr0z/Lm2v5ba1L1YY/tyTYT
         N8Ot4Cmq8LQ0oHhVE8nOl9x79CkH/SwS5ZOyiQXWH383ToekHyvhudUy+7n2Mb/SbSn6
         y650Zg7NxsdWqFW0M+M4pfTLw5A79OE5K+96Qut3udhkUeGC11XeuNwpTrEtPNngNR2R
         9zAcMY4bnS99bU/K/LlpF6niFwzCFBJUh8IijfqRZNRgJ73zU3PYVatZ3JnV+al3noW2
         KCefRC388RibUserT/7hqdrwgkiIGhLmWTwVKC4ApIQjEUVjj2opT4jUfxnav5g7/HXr
         xLiw==
X-Gm-Message-State: AOJu0Yx6VKMLRKTj8Xuld5rVKtPTQ0XBKmSiDuRjyA4lMNxJKXJCcx9l
	hTXcuZSYmZNWjaANdpGEuUM/M/fnXPs9W+unSPs=
X-Google-Smtp-Source: AGHT+IG7eqOTf1nv5cUcwpf6jvUtxOJkSX1Dkc9ogLNME8qtOmrfT8/tmdzW3HwHTKaw38gTrbGLB+cfvqQeARqseno=
X-Received: by 2002:a05:600c:3849:b0:40d:9877:ceef with SMTP id
 s9-20020a05600c384900b0040d9877ceefmr3473wmr.60.1704838572674; Tue, 09 Jan
 2024 14:16:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5cc0f83c-e1d6-45c5-be89-9b86746fe731@paulmck-laptop>
 <20240109155127.54gsm6r67brdev4l@revolver> <CA+fCnZewUEv2BMX-D=a+5wosusM-H3tOBpeJe6oyu51mMLXQnA@mail.gmail.com>
 <3c1213bf-783b-49de-b012-00494e7e991c@paulmck-laptop>
In-Reply-To: <3c1213bf-783b-49de-b012-00494e7e991c@paulmck-laptop>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 9 Jan 2024 23:16:01 +0100
Message-ID: <CA+fCnZddAhB+T8L0g4tcYoj0QMvhqcA75ZPM_kqiAEDBmLzpHw@mail.gmail.com>
Subject: Re: [BUG] KASAN "INFO: trying to register non-static key"
To: paulmck@kernel.org
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, sfr@canb.auug.org.au, 
	linux-next@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 6:20=E2=80=AFPM Paul E. McKenney <paulmck@kernel.org=
> wrote:
>
> Thank you!
>
> But no joy, please see below.

I reproduced the issue and just sent the patch that fixes it for me.
Please let me know if the patch doesn't work for you.

Thank you for the report!

