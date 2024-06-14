Return-Path: <linux-next+bounces-2552-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F15690855F
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 09:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D56D1C213DE
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 07:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A6C149DEE;
	Fri, 14 Jun 2024 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crF4ziqR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139AE13B5B2;
	Fri, 14 Jun 2024 07:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718351681; cv=none; b=QLfGi2IdyzZr7kYXgLg+udI5SpmCd8jVH1gdNBDbP/W1L/Vvpig5ph7M1G0yozn6PXNGiKbKrTORJfeljaSc3lMJZEJ5OZ8tVZ4/SYpTXPU6x+dBe/bfz4l7dAW03agSTCay8YwnYYA8S0SWQPZ5ykNGW1Cc17rTP3lX1775zVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718351681; c=relaxed/simple;
	bh=r34lUWB6Wj1yhAFCtaCkKe20jY/9F5fMcNzOgUVOXXM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVzl7eWlquhnESG7sgdj6TC+XJlgH/cxXo/LqfrICf547eSa6jlKN69bHVeNFJQUNd5u2yml90X3Yie9gyCf97FXaLBM8+E6Xb+3Ixm8iIT60OnLQrQgUKQ2PHRpnCSZyt7Ir7p//4K25jxAWtoI/gCe7fHjimRwYgpdR8GTtGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crF4ziqR; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57a31d63b6bso2464385a12.0;
        Fri, 14 Jun 2024 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718351678; x=1718956478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JENz9gjoDE8VylH7whW5Xrtvub29iG+BskWZt04ay80=;
        b=crF4ziqRsr2g+MATk+/w299SQMHqeq/+zEoZcIdRe6QkuoTU8hMQXrRDEISvAs24op
         Qn0lgHpqoQRlYvcL5BdZSNIr5gtebgD+NrtbynJSMpRizWfVB4eNjVr+qqw5610DaMjJ
         9DNt0gotzN5jnGxUgB0PRe6HXayW3A2bmVgzztaKes4Zjt3vfwTeDY+T0uC2VNjf4ghW
         wZMJGMbS2RFSdDOV8XM8RLR/kH/mDcPz2IAiID9zvz99UhJEqEDRSlbyZP+/JlGHsyLR
         l3tpdH6Ql72pvC8zP2Oxcj2n5XqLfBsMTq9hGRtU0BbMBdODzj3QOxi88MbatZjmstbD
         FrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718351678; x=1718956478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JENz9gjoDE8VylH7whW5Xrtvub29iG+BskWZt04ay80=;
        b=VA2nlcSuMbzxrRXnL0hmOWHPSncv4WmByvpGL/+4ykW7f6qR5IUABPleYsT3i83IVx
         OkKUg7fKfM+idgAot3nEQYV09F4IoeWNYykjVGhOJd2ETGBE4RXWH1eqv3jI803c2fgT
         o3gDitY87eHeSy6tOPDMaTkaFCGDs2bBmLBVlrzoxOuv95iCpiy2tqNm6GOZfmB4S9Co
         wxcCuLSINvHaxabt5jjQgHQmwOEtFUZTofOgVtFTPZtsgiZxG4spdgMml/DMjY1fbQFk
         uAFCoMgsqpGG2h4nyOFsTn+Z4PsLQlXvQJfxBHLdjqAAa/JhZ/L/+Hl1DCZ4zdZNXDPf
         rszQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj9QNRmszQ02JTerWdLIj/eh0TEV0xGlohC4CN5JmdB++AFLJ2WIHaGX39zFEsDlcM270ZLNJYuru/52lsXTL8vxixWv1kT75oVpd5NpRpFmkRYozQhUce5k4O+2BNa3TvPKLdBHTSqw==
X-Gm-Message-State: AOJu0YyKhZbOUJomuyqmDV7qHGh35T9zTJhFzULhsSm/nBRCIT7JAzIb
	Em69ioETynDSRxF0P9mp6pjQMZ2QQ1drQUPF6DHPgnJRgZuvHGJR
X-Google-Smtp-Source: AGHT+IFNchiNdfU9fLf+HjwkCA5OQoRrFuC2OpJdy3FhaTn1rFyBJ+NY+eWN+bHycS8NGVh0kBXeDg==
X-Received: by 2002:a17:906:2709:b0:a6f:4ebd:31a3 with SMTP id a640c23a62f3a-a6f60cefe94mr144821366b.14.1718351678058;
        Fri, 14 Jun 2024 00:54:38 -0700 (PDT)
Received: from krava ([212.20.115.60])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f41737sm155315366b.160.2024.06.14.00.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:54:37 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 14 Jun 2024 09:54:35 +0200
To: Bert Karwatzki <spasswolf@web.de>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-next@vger.kernel.org
Subject: Re: commit 1c29a32ce65f4cd0f1c causes Bad rss-counter state and
 firefox-esr crash in linux-next-20240613
Message-ID: <Zmv3O8W-OqUqkPwS@krava>
References: <f4ea65e28ac47e6acb13f401f46a414a2f50f7bf.camel@web.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4ea65e28ac47e6acb13f401f46a414a2f50f7bf.camel@web.de>

On Fri, Jun 14, 2024 at 01:40:54AM +0200, Bert Karwatzki wrote:
> Since linux-next-20240613 firefox-esr crashes after several minutes of browsing
> giving the following error messages in dmesg:
> [ T2343] BUG: Bad rss-counter state mm:00000000babe0c39 type:MM_ANONPAGES val:86
> [ T4063] show_signal_msg: 16 callbacks suppressed
> [ T4063] Isolated Web Co[4063]: segfault at 396d1686c000 ip 0000396d1686c000 sp
> 00007ffd767b30a8 error 14 likely on CPU 7 (core 3, socket 0)
> [ T4063] Code: Unable to access opcode bytes at 0x396d1686bfd6.
> [ T4211] BUG: Bad rss-counter state mm:00000000cd9fc541 type:MM_ANONPAGES
> val:817
> [ T3798] BUG: Bad rss-counter state mm:00000000432d87c2 type:MM_ANONPAGES
> val:181
> [ T5548] BUG: Bad rss-counter state mm:00000000034aa27a type:MM_ANONPAGES
> val:242
> [ T3823] BUG: Bad rss-counter state mm:0000000099734197 type:MM_ANONPAGES
> val:137
> [    T1] BUG: Bad rss-counter state mm:000000005e5e2f2f type:MM_ANONPAGES val:28
> 
> (these are the error messages of several crashes and the error seems to affect
> other processes, too (T1))
> 
> The crash can be provoked to appear in ~1min by opening large numbers of tabs in
> firefox-esr (by holding pressing ctrl+t for some time). With this I bisected the
> error to commit "1c29a32ce65f mm/mmap: use split munmap calls for MAP_FIXED" and
> reverting this commit in linux-next-20240613 fixes the issue for me.

+1, bpf selftests are failing for me because mmap fails with:
  mmap(0x7f9361bc9000, 4096, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 4, 0) = -1 EBUSY (Device or resource busy)

did not get to the cause, but reverting the 1c29a32ce65f fixes it for me

thanks,
jirka

> 
> Bert Karwatzki
> 
> PS. Please CC me when answering, I'm not subscribed to the lists.
> 

