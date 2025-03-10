Return-Path: <linux-next+bounces-5707-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD16EA5A69B
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 23:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63821188EA39
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 22:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0681DE2CE;
	Mon, 10 Mar 2025 22:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZ2+0vFc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E301D63DA;
	Mon, 10 Mar 2025 22:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741644094; cv=none; b=dWlflmYmfKEVhrLg/ZfnIwSFFJeT2c6Xy5Bph4fma2iw6yxql6UYYJcaG4IBNmMtAFNB/gT/wEsccQNip+xqqQ5/UOv+L+aJyBnL74oBXvkEGDUQsDKrcwQr8XedZVbCba5FSvvqWxdt9HBa4L/45RvrU3ZzXZVRDOHMalpittA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741644094; c=relaxed/simple;
	bh=pRupb2oNNzqFmYygFyIG8PcgTW0lNPekWKRuoiAiaa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWbI8nakoaiVcce6tD8fSPmcdTfa9aQrfSbRIzrM8m4GrRawsvQS8XoQUWw1zpD8fX/itlukOVq3pnGh/TuCvMd36fG0fXxT+SYJWuBaddYOQwmp3TjQR47ppM4rEZLSsO36uYH8N7qGEFaJR0JWnqsiCJ401SgX/+CT/c3oxcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZ2+0vFc; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47692b9d059so11960641cf.3;
        Mon, 10 Mar 2025 15:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741644092; x=1742248892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdvztV2UNV3iREuCFs0Tdfwyn+fNoCwFXjwdeFVOfSQ=;
        b=XZ2+0vFc7NvqdZ3b22VFdllKwfmI3lwfAbfW7OIE6EgBV/w2PUgj3lYEYiZrbjVDh2
         GvjJnInN4F023bGMXyV4ZKAgUwGY3aTpyROWpG2MrwSi6grDywG6M9AlsfmXjeN1hf8y
         6LAbMLBi3ebMyA7bKUiaqScThPpOfLPIYB9+QKTo56RXeqKroZaTI3B4bBQcWC1RlvnL
         vJUkHEkWoUZghDXhqtHWN1NleDbZuplIsk6YYFgw8VRZjxxXMX8WOa1qMI6GT2KmPsqc
         vxwvARzMShIu8A7CxFPuEQFcipUSjmihDzPddHSotStI9srfuvaQ4uhhzzAidwd3MQqB
         8Tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741644092; x=1742248892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdvztV2UNV3iREuCFs0Tdfwyn+fNoCwFXjwdeFVOfSQ=;
        b=IRpdlnEtoxWNkxvXA3ZzB1/2uIdfAghS9JkWYjYqHmAiSKU3fOgFZtBCwffFMc8FaS
         31+TOb3zrJxC7xX7xIVWM/D7TbeuyPJc8f4m16b5ydJok2JU59it7XloEi1CBPTT+ta3
         0cuQQisxozr70WcDVwCGL6SWO/WQKSSQEx7mfR5RgPvCchc/NzXmf7xbgClV5TXXqjZo
         /lnZVmxKAdxD1wyoLkrARHCeRXK+0u2tpFdav6As1tSa6BYeLfqqBYWwiyhbP3858Mpw
         4e4z1gm8jBwSmsSSHUPyZm3FnrVRwoLyCR7ADo3IoQTiMYO0aJNZG02CRUgcmxQ/Z3dZ
         Qd/g==
X-Forwarded-Encrypted: i=1; AJvYcCVFbQGeY/3rkjy0U3Aeo+oZBm+7qXGUPQbh3yjzfbPg8jv02f4+rD3MIYtGTGdygKDfARr8Yedf555gZWo=@vger.kernel.org, AJvYcCXdTfhKqIlUlKKHb1QbYEXOyhPKyQyQ9R6UQ0jz58gEMBdfk3KboYjpzUMt67Ap7G93CeqhScrN562YOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFUQcbM9AxvuAOnNiBJ9KRLoZdJoMUkyVzEeNSqCfW7OEM30S+
	TZKUj2K4Kj0xh03C/095fGQ4Yy+8klS7dhErbp6Sa87jOpUdSGbd
X-Gm-Gg: ASbGncuWj01PEExYtA3eaFqMR60p/3e/Uq+R2har6IxN244pI90iGXQb5haZ9x3vJV9
	OoJ7exQdF0Xr16EMpAyKpJc94uRCR+YUbjbrSKPwOGh687//bcyRcYcUso7qm8wZCJGugqFTZ/q
	bM2GElyfr/UywBzr3reAAocx859i+k1wPxycTPpcV/J5Hb05vgcqwcPu/Gee6ZZ67sxHuef0TIN
	cUmB3T5NBqwAv5YxS5FJchmMVflTstvYl4yZ2WGwG+HLaPIFQ2VNSXenOunfY9UbTShX0/0jYSV
	WHqqNwfXNKyLK65kIyMN0dNnqxTyJLN97AThbxD3Le9SXzRmzPNBpE0vXRBtGfSTLANvwCXHwV7
	qmGtYqOzdFlBUKn5Oq2yY1EN3gMP43omdC0I=
X-Google-Smtp-Source: AGHT+IGgfkNiTKs8kRaKzx2N3m1Fc8TyKDQeFkvs47dX2/pWYXkac/Rft4eDWhDswO/2IL0+VU0SOQ==
X-Received: by 2002:a05:6214:c83:b0:6e8:f0f8:67f7 with SMTP id 6a1803df08f44-6e9005f7742mr240510936d6.16.1741644091816;
        Mon, 10 Mar 2025 15:01:31 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8f715b604sm62622926d6.77.2025.03.10.15.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 15:01:31 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id E64ED120006A;
	Mon, 10 Mar 2025 18:01:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 10 Mar 2025 18:01:30 -0400
X-ME-Sender: <xms:OmHPZ2m0a_6OvXyfpt-LryyWqCFxc2N3PfzWiuqupdxkSeLFi7q6Kg>
    <xme:OmHPZ91CtL4uFdiRLGsYEBiaobWKFfFnhVUDGrzhsVIKvLp613qVRUiMq7kyhVEGn
    VpvTAU91ocJCXkCAQ>
X-ME-Received: <xmr:OmHPZ0pe72fZpPP-RThW2PpFwZ1LcIapqNDg3ivvo7TApvHcIU6YTCXAzBM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddtgeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepledpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrgh
    drrghupdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepfhhrvgguvghrihgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggvrhgrjh
    druhhprgguhhihrgihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehurhgviihkihes
    ghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehjohgvlhgrghhnvghlfhesnhhvihguihgrrd
    gtohhmpdhrtghpthhtohepsghoqhhunhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:OmHPZ6kNvaz28UEYti2nC-R6PoHx_vonAQGoerVIt2bNP3DSac3zPg>
    <xmx:OmHPZ01r1Mim8dUjXYgWAWxLdFrEP9KQYxcxHQe3pAi7PrT7KwDtKg>
    <xmx:OmHPZxt6u4xfk0UnRfTd-DaAVu7LfhPq5vLjM_9xKXlRJARC7ozeYw>
    <xmx:OmHPZwXRCMmz4V33wK3nZjKxK9T-1Co5L6vQpGRfr1FozYsVy7l5kg>
    <xmx:OmHPZ_1J2JPpJSilgX-3DfLM_pkQ3JfKMIO1ZUxoTtHYrj16y7vX0TQi>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 18:01:30 -0400 (EDT)
Date: Mon, 10 Mar 2025 15:00:09 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <Z89g6ZXRHQUq8WyV@boqun-archlinux>
References: <20250311081301.6a22ab25@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311081301.6a22ab25@canb.auug.org.au>

On Tue, Mar 11, 2025 at 08:13:01AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   fcb83ae12343 ("Revert "rcu/nocb: Fix rcuog wake-up from offline softirq"")
>   c37cf754ebf5 ("rcu: Remove swake_up_one_online() bandaid")
> 
> are missing a Signed-off-by from their committer.
> 

Thanks for spotting this. These two are likely for the next next merge
windows (i.e. for 6.16), and presumably they will be handled by Joel
(Cced), so I deliberately avoid putting my SoB there.

But I guess it won't hurt to add my SoB for -next purpose. Will fix this
later.

Regards,
Boqun

> -- 
> Cheers,
> Stephen Rothwell



