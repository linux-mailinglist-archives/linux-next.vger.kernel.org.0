Return-Path: <linux-next+bounces-8399-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5360CB8D7D5
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 10:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04D68189CDEC
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 08:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C483C24418E;
	Sun, 21 Sep 2025 08:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpocAxWm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE851E8836
	for <linux-next@vger.kernel.org>; Sun, 21 Sep 2025 08:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758444220; cv=none; b=KyD/+It4EPMegTFG2f41eDaoWZ5WwkYqYOzh7aQQljXzAW2jJthG5vWafwM2nlqTsLdY3bKh+cOampUkU7SSEalIaWd9kf2FdxmHJWZi7meko1fkRxS0b6IQSE7enXeGCvksueKw6OBY3ASgGM+HxweQ3dzK1OcNr20+yu/QVK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758444220; c=relaxed/simple;
	bh=UjN52QhzqZyfjm57PydUQ+he7++5mFgxAuApM6NaDqQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qNa/N+cb8vV9P6p7tSOpAYcko590ouEAr6cfx6TKIqlH6qRYAnpukQC1Po/NbETnNAAvrO7NmWhA5p5xzgPs8NFjCHp2ozir/1grZ4aAA5IYTOLRb6nai/0VxIBciFpeNoUy48of24yuqM84TdCW2NRh9hDINHvQKjnPFDxYra4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpocAxWm; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7761578340dso4167018b3a.3
        for <linux-next@vger.kernel.org>; Sun, 21 Sep 2025 01:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758444218; x=1759049018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qhuxGkdlbYwQtUxo9AAy8/gz7UCzFi3umGZgoVwppwU=;
        b=DpocAxWmxlXp4e3TwzawQD1HZjkJi5pS+uoCiOESqubnDUX+cA1jHNyQGrxhAeets5
         OywjNWx+Q/B4VmrdOjWDfLObQ+VB0bkhggZjaFE8cu5O/qa7JRQyVLBj+PobBL3JPrGP
         q6E0a/MSiJuruPyjw3WjvI3Wo5f31xR9wtbnuoHZC7OMIEe1Q32hKfZ8DGrCpxAKA5Lc
         F6rRMb5oHPIj1WeUNwXceki7nLdxauRiZMTeZy1y2m2T9QGK5ryYM4VaB0ugL3ckPvM1
         PyS1/XnF+Xymy+JAdOfcw+q9XmbbFoOVrL8Me2i1hqpQluVn4vWygU5bMlLrg0bot0yR
         /d7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758444218; x=1759049018;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhuxGkdlbYwQtUxo9AAy8/gz7UCzFi3umGZgoVwppwU=;
        b=l+bctaZny6pSSR6pmdMAVS829MNjOum8sk+ZIRryJs6nIORl4q9SqCL+Wbob4JX4FE
         v8fM7H4/gDg8tcc5L66JZQizWhSA000knPpFuD15ySiLLOTpCf9z3IrptoA+puxXKnJ4
         rCj717ZYF4d43v0iw15mX2olJu7P0uoFBQhdFTVyQ4qVinJp73oQXl36IFDXmb4bJXzs
         rGgwUaYQMNVU+oP3bNZKzMfhKbCgGZna0kKJRU/QxC4LTRYyb7EeqLjLW6EGNJXM46vm
         D2JGN6NYTW9fHbRiA7YqcL9SVZObNW3vd2XD/bkAUGs7zY0yd/tFuVM24H4XistkBuSA
         CtFg==
X-Forwarded-Encrypted: i=1; AJvYcCXSYnE7rQ69QL/wICm5+UDCOutNcy4buOB9fKY7K1yHGjks4fg1QEMoELaIp7arf01SuvLs+xcZQRS5@vger.kernel.org
X-Gm-Message-State: AOJu0YwhvhpLyjjVm4nThO/qjwVptjQ0lJkKJBOlJeqFWGsdUC/r5LHs
	SeyHLwqWE8dyS8Fvrw32tCwlbfdKFq9ndG0UCZwHROlD/CJcNFo5v02GI4t0/Q==
X-Gm-Gg: ASbGnctzU5cYUgw3XxaX2bv6z6CbuSmCJ4bBHbutHmypj34wbeRyS3QlntrYnCWW632
	1AsrsZRJHKilthz+hRnXyTUShMlKRUCK4xmFDnabyVfXxu6gDqZz7dr+qvEut/USUK5V8P5g/W0
	Xj8tq1U7WHcQ/2+fd5Siiu+B1tSyMgH4QmwO1BA7xRpXnj8ZCPPs/p2IYeP9aF7m6p+sbdNTmlo
	FPBT9T3z2Db/I+Vyn2idgp4Wc4ZTJe6MBuNEk0v6lERGfW1Xj4A+hqoJt8R/ChCErQzY8W5n9cA
	Eh1brn5crs1SlHrOq1Z/zXJfvYSp6/+Qf/deuMX3wuSUkflf9hlQmCf4mp/iJZEflcVsiCe4R7w
	15quNKC/f2mkzB7P2V0h38lEy5TbFllsA4maryUoD2UmqGdQ1vCCQ5Xkrfy7FVXKn8I+V
X-Google-Smtp-Source: AGHT+IFqCRKRtItqhHVLVKIhfbYwcAdS9aUI+YCtSIJZLyIniucuWcyztE1Fb64OCQV1kf2LRvwPVg==
X-Received: by 2002:a05:6a20:2445:b0:254:84f8:b280 with SMTP id adf61e73a8af0-292748080d1mr12116002637.49.1758444218470;
        Sun, 21 Sep 2025 01:43:38 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b552882b177sm5004313a12.11.2025.09.21.01.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 01:43:38 -0700 (PDT)
Message-ID: <54d1f3b1-ba8c-458b-92d6-9d8880952e06@gmail.com>
Date: Sun, 21 Sep 2025 17:43:38 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: linux-next: Tree for Sep 19 (make htmldocs problem)
To: rdunlap@infradead.org
Cc: broonie@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
References: <883df949-0281-4a39-8745-bcdcce3a5594@infradead.org>
Content-Language: en-US
In-Reply-To: <883df949-0281-4a39-8745-bcdcce3a5594@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Randy,

On Sat, 20 Sep 2025 17:17:56 -0700, Randy Dunlap wrote:
> Hi,
> 
> On 9/19/25 8:05 AM, Mark Brown wrote:
> 
> With today's linux-next, when I do 'make O=DOC1 htmldocs', I get:
> 
> make[1]: Entering directory '/home/rdunlap/lnx/repo/linux-next/DOC1'
> ../Documentation/Makefile:71: warning: overriding recipe for target 'pdfdocs'
> ../Documentation/Makefile:62: warning: ignoring old recipe for target 'pdfdocs'
>   File "/usr/bin/sphinx-build", line 1
>     ELF
> SyntaxError: source code cannot contain null bytes
> make[1]: Leaving directory '/home/rdunlap/lnx/repo/linux-next/DOC1'
> 
> where the "ELF" line contains some binary bytes that are not shown
> via copy/paste. Here they are in hex in case that might help:
> 
> 7f 45 4c 46 02 01 01 0a              .ELF....
> 

Hmm, my /usr/bin/sphinx-build (under Ubuntu 24.04) is a python script.

Running "file /usr/bin/sphinx-build" says:

    /usr/bin/sphinx-build: Python script, ASCII text executable

Randy, how did you install the sphinx-build?  And which distro are you
on?

> 
> I don't see what is causing this, so I am using the previous day's
> linux-next for Documentation testing etc...

Another question ...

Does going back to a past linux-next make sphinx-build work again?

If that's the case ..., I'm not sure, but it might be related to
Mauro's sphinx-build-wrapper, which is now in docs-next (not in docs-mw
for v6.18 at the moment).

Randy, what happens if you revert the latter part of Mauro's series, namely,

  819667bc3ccd ("tools/docs: sphinx-build-wrapper: add a wrapper for sphinx-build")
  2e1760999e58 ("docs: parallel-wrapper.sh: remove script")

  ... up to ...

  42180ada39da ("tools/docs: sphinx-build-wrapper: add support to run inside venv")

on top of next-20250919 ?

Regards,
Akira

> 
> Any ideas/suggestions appreciated.
> 
> -- 
> ~Randy
>


