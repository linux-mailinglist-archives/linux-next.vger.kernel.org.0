Return-Path: <linux-next+bounces-8319-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 669D7B58866
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 01:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 795E37A1E71
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 23:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C649F2D878D;
	Mon, 15 Sep 2025 23:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gF9kcw0E"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312EF23BCEE
	for <linux-next@vger.kernel.org>; Mon, 15 Sep 2025 23:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757979826; cv=none; b=GeczH37E3T1X1AfB8829Y1e3uXvR25l10p7RMoMBlkqjVb733Mzz0UT3QGJynclzMEKm5vqRIfFecWEFuMDNXk6a9z25rUsio0D1IYuqcMgF6/RTkkGh5HMOBmRTQMspoH3VWExIkaFtScPQTHFQ40jO8CAlo1vE7peVTnJ//0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757979826; c=relaxed/simple;
	bh=DCeF63tBNbF7HFYiehXMRuKCFYhth2Gi/fMLF+uJEBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ta2HYLls47UmuAeputJlcSe9qf2ikAgPB7KSKc3wPRpb2wa2nw2Y/tEmdyBQselElG+q+Z2KrbAnj0m83hQ9x/M8GGQXisws6XYSzhvQdVoEcdSHkfgibo5Ot2ueqmvcn6L5mN7AVIJaTsStPITOJa+7gm5flwWpNSnsA8szWoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gF9kcw0E; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-80e3612e1a7so825750985a.0
        for <linux-next@vger.kernel.org>; Mon, 15 Sep 2025 16:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757979824; x=1758584624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdgJHBrB/lzs7soTL/dZrbkv934nXJ2LKfj8nw3fMYE=;
        b=gF9kcw0E/T6NA3uVIqDLVEEGBfPsBwAd2mqvKNK0Kqj9s/VePjTg1imoErNr8c9gUy
         nE388B8mXbR7w3E+ulB0/QRYplUg6R0D7+QIZncrn1pAK4Eown7WHBsspBEtmqe6YlQB
         Y3SSYY3rwPkwOIyjrSKfDKZ6inB2PCInBVSt8kw9rpENV0Us1GWXoFCgO4ND3Rm/j+Tk
         wxYZLZFWW2SOFSGoYih5NIIJNHhKlcrC8ex9g33JVHaeztKj9jvmcoJsxSvsJwqizdzT
         XOHJy6U90GEZSQkjNKQENGm+n2EtGDZtaXh/dkK4iVU8oCrbRhMrSyaIeiAhySKrdUZV
         D7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757979824; x=1758584624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PdgJHBrB/lzs7soTL/dZrbkv934nXJ2LKfj8nw3fMYE=;
        b=RnTVoStOkTLrDbAL1Fg4gFrM8XE1CYOkCSLLyTej4ovQyx54Tngr5Sjs1RPLLk9gsY
         thm1Gw2WnUfbfbmzzlryPnBfTYUn+7ooqBaJWHqgPPmKiExKIG6QxTg/daF6dtGGo2OB
         0OeHQ0NpfBl0UrREp/z9V18i+EG8QnE8dyAZUYhaKCgOyRu4GiysuDTVXzG7w0k1+Llo
         fUoPbsPdmxEDVWoZsnu1rpi5Glpfs7QxNqdfzrJoSSsnxF0ZGns33Z5gj8moXjZe3uel
         Rp9he5jmbfjRgh2vsLC+8UhTzRrw5BDfV/Do0NRh8336aglaDSqV4+79w+AsXLj0GBQN
         rPkw==
X-Forwarded-Encrypted: i=1; AJvYcCWk7SPnMaca3jaXiWgPNu36JWXtwXCCIcOPPqtVSu9g8bI7hzY2rwxe/9ZoQQfwKvq1QJ6qBctU9xOp@vger.kernel.org
X-Gm-Message-State: AOJu0YxZeS7mtI6mHK3H7HP2Jb/lU5rY1v4wPzYiEXyIfUCo3O2OeR7/
	dHYoI6IRRoDGPmnVeCff9r4hVVVZrSux6FDPxr0XfrO485dHIYchlnK5
X-Gm-Gg: ASbGncvO7k9kL1zp0AhPgjEGiKMDkdkByWfyPZJXkdoLGMFI9goIipk1SvepNZhaR/v
	3jYnujEw8Icu6Zc+VY4d1N0b6p0macjvi8MLr2MrRTyggjE87HNxgRRXbJM4qzsEj/c+RqfRw9S
	5qX36TL3HYHuWw7vHfsZXJWYDL3GIWt7b8G9emrvaD8KsrUWR6fIdsRrPc5xzwEgaJSh/r+yAdy
	XEIvfUo206E79HijrIhfzO5IyDie0A/M8wqQgGiCSzFnkOWpekoJY6r8TCMe99iOsLjnTh/vMwu
	eTXRRgssHOp59tfuVMgLJzT1LDye05FRCxT+n9To/yhH6dR3ozDgsnIrpU5rqxFmhYo3USDXuFC
	xYDwm9k+3B232O3snx+fYeVqVLtlzmplOzhkCmahY7Phxo/wyhFyOdayeh2buSy2B9rNvI9A6Qz
	SWRaWNXFeowhc58bhPq8VCyvkK4Lpj8wvQTg==
X-Google-Smtp-Source: AGHT+IFtU7EGaYy0d2f1MqC/XVc068eWREOrfFX9Dv4w/usYLmOlLWrTddm+QEvCMQWyuJIKoB/FxQ==
X-Received: by 2002:a05:620a:4007:b0:82b:46c7:7249 with SMTP id af79cd13be357-82b46c775f8mr200373185a.24.1757979824066;
        Mon, 15 Sep 2025 16:43:44 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820ce19d151sm845214485a.50.2025.09.15.16.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 16:43:43 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 05368F4006A;
	Mon, 15 Sep 2025 19:43:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 15 Sep 2025 19:43:43 -0400
X-ME-Sender: <xms:rqTIaB7li7PgqrH7NwXXHRXivw9ArLOXOkLAg10qfyk5tGPbct3M6A>
    <xme:rqTIaMRZL7pu93dT-F1XvsEGskZbOO01vKYJskWVv6_13OrSfvMIgAAXXwFqZTQSI
    DjbgezHbITPkBtefg>
X-ME-Received: <xmr:rqTIaPzHgWL5aNPd3Ufxtd5nQgtWWyxHmyHY45ZJ4eH_bq5SCQjYjjqxCoau>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefledtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepiedtfeevhfetkeelgfethfegleekfeffledvvefhheeukedtvefhtedtvdetvedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihurhihrd
    hnohhrohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghqvgesghhoohhglhgvrdgt
    ohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpth
    htohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepmhhinhhgohes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:rqTIaEr3_gJg8HWvzMmd_0jIi2Ve2bxMZbqOshVQqxL0a2H25a0Nhw>
    <xmx:rqTIaC3XZT8VHt8KZm5uylFi3x041uV9UThQ6dZi4U7YtOAZP-UJBA>
    <xmx:rqTIaEzOpWpLmoMcJ7XUbUp5P0_LrsqRlGpTlzlLlK-1-ttTu3-T3g>
    <xmx:rqTIaGikediGB-Qqun_LVTco-H5WrpEBjscboLri0PpDSrHqwUTJjA>
    <xmx:rqTIaPqzriwvZVqjYr7Xvt7sPgvS56CSQh7QoGI8wexHn7Of28d8H0xm>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Sep 2025 19:43:42 -0400 (EDT)
Date: Mon, 15 Sep 2025 19:43:41 -0400
From: Boqun Feng <boqun.feng@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, mingo@kernel.org,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: linux-next: manual merge of the bitmap tree with the tip tree
Message-ID: <aMikrcaVbSYdkdmW@tardis-2.local>
References: <aMiZpcBu2LDzwCje@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMiZpcBu2LDzwCje@sirena.org.uk>

[Cc Ingo, Thomas and Miguel for their awareness]

On Mon, Sep 15, 2025 at 11:56:37PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the bitmap tree got a conflict in:
> 
>   rust/helpers/helpers.c
> 
> between commit:
> 
>   ed17707bd8f33 ("rust: sync: Add memory barriers")
> 
> from the tip tree and commits:
> 
>   ae384a4623fc3 ("rust: add bindings for bitops.h")
>   78d9de4ca3474 ("rust: add bindings for bitmap.h")
> 

Thank you for reporting and your resolution looks good to me.

Regards,
Boqun

> from the bitmap tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc rust/helpers/helpers.c
> index a16758a6ef395,abff1ef14d813..0000000000000
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@@ -8,7 -8,8 +8,9 @@@
>    */
>   
>   #include "auxiliary.c"
>  +#include "barrier.c"
> + #include "bitmap.c"
> + #include "bitops.c"
>   #include "blk.c"
>   #include "bug.c"
>   #include "build_assert.c"



