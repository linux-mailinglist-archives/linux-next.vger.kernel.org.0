Return-Path: <linux-next+bounces-8491-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF96B9FF78
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 16:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCD122E4C0D
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 14:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A292BDC27;
	Thu, 25 Sep 2025 14:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYKnm266"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBAE2BD5AD
	for <linux-next@vger.kernel.org>; Thu, 25 Sep 2025 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758809709; cv=none; b=ocYvQl0VclnYeGLL7ltZxy52gI6XbdpuhvTWvbHBEMMSlARPu9uUcSgFGgLJ/fo/9hMLcZYqJKhW05SsE9Qmw6+wdwutEOxbKZeAKBM/hbrdjDzz59WdSx9tBotrQwwczZicEdfrHnAEdqw4gz76N9FMDVpqJ1ZBTjHiAX1YReI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758809709; c=relaxed/simple;
	bh=nuislbAtqmU78XpJlZX4vNz0vwiV71O1Kx5IczGC5SE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=kYaLz7f1BSxc/pu2IYYA0KmU2iCSaGC81qu+NCwTYRHSBSIapGBlTLuJ1Qhzj7+Mp7llYbVaK/gDx4PknKBqf421yrz4PNXZfe7IkvOg/GOetL9Ztviops6N7v58EUv3aQHrmrBtxviix+QRbHe5xKJnWjol+yEddDZj7tA+k5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYKnm266; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27c369f898fso12023555ad.3
        for <linux-next@vger.kernel.org>; Thu, 25 Sep 2025 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758809707; x=1759414507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTn7oez8OOqttdy0B0PFYhUePNvjLlG8H/kSBIplgEA=;
        b=OYKnm266GVr4HR4TJoNi1tcFHjlwYNPPe1UG9jcl/9e9PpAldqs41oBqireaCH8Zr8
         NjxJ+A42kxWJxt0MVR9vCeMqBBzbMbk2pheEpWZuoCOvAZUdrMrPBPufrYxagl4oiT1Y
         fqDq57NTEj9ZmyAXJUj1/fgHGPLCmFKTZGce8OdQSWu+pJEzLjEXjq6vYJv8kllVK7Sz
         2arkdnJs/W8EWTzrAJbhqN7+Bm7JW9HMdaLBEmqY79IKMwX+bjPTCxI9ThcvslZAdIb0
         BFGEKqjhUZ90vOLkuvN1v5iAPDpAwtameZBjHiJaQIJ84yn4RlRbUiG1/UA97CgMB8YF
         ZxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758809707; x=1759414507;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DTn7oez8OOqttdy0B0PFYhUePNvjLlG8H/kSBIplgEA=;
        b=tGJhdAEIg0HcQIcTxxpfsOgsdBOWEKPFCsf2GZf/5Pgqwb4w3Hw+5IfMt8AweQi0rT
         PmDbCG9mdX3B+02OEUI6XuqgSx+q1szkmiyvkqkReucronvZtlTsZWvCKjmeMpkUdSix
         yeqQuRGXmpWXquTPn3JTcvR7IDr42iMF/vHrLFkGTtuuIuQGS+7+2BBJDg1lk/O48bSX
         jfQVem6/FUer1pIABeIKj4wOK9m4we6u7GXGirtjEhEFCI+E6SFuvWFSsTUYxHyXeShU
         CfHgev3LkzWLIfB4iTqLatQM054BH+WRnG7QHXo1RR+I2wxvg2K372jipdAHEPsX2D7F
         RMaw==
X-Forwarded-Encrypted: i=1; AJvYcCUbqxi93/RTrhXi/Ok+mYgwf//zjOelD8Fn4xevxa2yjjEra1hpZNwVAFUnsCf5SQyW4mlg0QhHxDyO@vger.kernel.org
X-Gm-Message-State: AOJu0YxVdE1GVWoWDIzERdABE6OAhu6aqUwn1ckda9cBp2d8OeMrimkd
	H928vPlh8ogzk6OgVFoRGC9YjGodthS1ADyYta4DTd1VtckZhykCg5l3
X-Gm-Gg: ASbGncs0BIFDRizm677441yUt8H9bZNbmcspAiy0seYQyPreeYt9Ie9kqETEVLYrz0D
	tSjajmDgp6+GHooGzUW6Od0tnJ3MrLx3DFb8CPaLcNNqT94dRLth8lUHIMo1mz0rKAnE8I8HzIr
	j3aThtyMpahYvO9rTh1j0edL73kD8z8/9FO4LkbJ2AGTP75Mi0VDTrI4HmCIpDlc61IlVokJ3pf
	m8jKzabRYXOXrVfDvKtmv6dz3fpIDzjaqsK9fI1LiZtkDBqIk8gmCqld4d6PJkwa/IcdBsFgC3k
	S7NcIhP7SsnL6o49B7xHpNVcdScKMiOyJLoPZMtvkBwMLkCUpcgAylV6W6c8gManqJbM3EBxSYb
	p3W1s2RrcPCarksbJ6XNvV/HJYJnhJ3BgPiixKQyE8Qd832iVXgn4WI13lL5009Ag031J
X-Google-Smtp-Source: AGHT+IGf+C9wBYJZEIjno4ujMvEF5ZwL9cnu0wsxmJrVEUsdaEwrDpFgSLVxq/qYS7s9JPxVrPjc9w==
X-Received: by 2002:a17:903:bc8:b0:278:9051:8e9c with SMTP id d9443c01a7336-27ed4a56ce7mr33844965ad.42.1758809706785;
        Thu, 25 Sep 2025 07:15:06 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69b0685sm26317945ad.116.2025.09.25.07.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 07:15:06 -0700 (PDT)
Message-ID: <3666a4ec-ef29-4342-b3aa-8c602c258bea@gmail.com>
Date: Thu, 25 Sep 2025 23:15:08 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: rdunlap@infradead.org
Cc: broonie@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, mchehab@kernel.org
References: <e7c29532-71de-496b-a89f-743cef28736e@infradead.org>
Subject: Re: linux-next: Tree for Sep 24 (htmldocs / pdfdocs)
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e7c29532-71de-496b-a89f-743cef28736e@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Randy,

On Wed, 24 Sep 2025 10:54:18 -0700, Randy Dunlap wrote:
> On 9/24/25 7:41 AM, Mark Brown wrote:
>> Hi all,
>> 
>> There will be no -next releases Tuesday and Wednesday next week, and
>> it's possible I might run out of time on Monday.
>> 
> 
> When I run 'make O=DOCS htmldocs', I see these warning messages:
> 
> ../Documentation/Makefile:70: warning: overriding recipe for target 'pdfdocs'
> ../Documentation/Makefile:61: warning: ignoring old recipe for target 'pdfdocs'
> 
> 
> Is this a known issue?

I could reproduce these warnings under containers who have minimal
packages needed for htmldocs *only*.

Current "docs-mw" branch doesn't show them.  "build-scripts" is the
one who carries this harmless regression.

By "harmless", I mean "pdfdocs" needs texlive packages anyway.

HTH,

Akira

