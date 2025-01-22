Return-Path: <linux-next+bounces-5295-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A7BA18F13
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 11:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07819161040
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 10:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7651B4F3E;
	Wed, 22 Jan 2025 10:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0R63Dnm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E25B136A;
	Wed, 22 Jan 2025 10:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737540048; cv=none; b=n89cN2aTVriu1n4iZjXBnTeoTZ+9o5c9Z/KVY0HMjPFt38NTkQg3fmu77BmOvLfBSP3gEjWQS322Xt+8SJz98AgeAe6ZTKLZ6Slu3LrawybzvsK4ZunuwaL2C4SeU3kopGnHnAPm1SHgzEm6SoEcpHZiYC0sT1hEQScJadIBGos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737540048; c=relaxed/simple;
	bh=U5bOtD6/Hmi9/hnQmZIT9q5nzHRnzwPLC3Bep17Rw1U=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=i0MrYioQjAHPhh55HGSXWB6xnSxRdEDEHEWKuURwrgtB5TzA2YISWQWwb1X2TiYQ7r900ZpyINkm633c9IAgILJKbeziXBtBdg/ufQf5qNTnR8xtCx2ylsV94YhfgqJN7bz85PRc5eQqjx0uUZmV7q9g5U4RNxgbftwWJK+kQLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0R63Dnm; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21680814d42so108953405ad.2;
        Wed, 22 Jan 2025 02:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737540046; x=1738144846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCwzBxa9p/T9m0rjHeFePnA1ZOccLCzpcgdH473vZ14=;
        b=Y0R63Dnm11urm129emyFhf9PWQkF50T+PId6VdG/FV+WvziVRFLhY39biQLHkb3sFJ
         UE/XPPu/iv7CEfPtn/7ZZMj7898dwcyGQTrBhj6lsiHKJCqY6IvFnEOjOQ2JiszaYhFQ
         8yMS+L0u1IwJUH9ijLB5aUEUTT6FbNaLjEbJfXQ3f6+tu34a1gPTSQFXYgxjYkgUkHlk
         f0Me8bFoLgOGGoEdSKJklr1bXOxpatngdPjOOFjrCcaqGeiAx+2useEhX2x2MIHNzhTo
         QpS0eQ9DpPnQPmgNlY9nwWkr9DNYpgFIOeMbGCN01bhDyTCi6VGGwA6NTBYtPv2Vb030
         PH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737540046; x=1738144846;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pCwzBxa9p/T9m0rjHeFePnA1ZOccLCzpcgdH473vZ14=;
        b=ZMhnYv+OnFpTyd/3ov77S5CADOVIBPK7ubFeFZUvz6Z0JUAB1DFbJNy0lx3WVxR68t
         X9pdl+rNy/YO+v6q6umSQZ9L2ru50Z312Bd5nNwoT9QugxR7a4UhNX1iDG/jPlfr95td
         q1k8MyKC3gbMk1QBEAaADNa3iYRBp+OSsz2MEjiQ5U1eJ9aTXoUFzBnRNPV0THHhkkr0
         sb2RLOcK1iEW+naY4NE1lN0P5eQS13T62xyzgbzy3YKCNZxnQURMBlwPS1QmwO0YBfbx
         C+PAMt4TuPjxifGI2BweTLWa99rvJDN8HUiHQvf5JfFK6C3uPKNvrrlk8MjLGXSBCeRK
         7WzA==
X-Forwarded-Encrypted: i=1; AJvYcCUO/JA6FGEgCQTNvl7KkFbxBCgLZScCbx+ZX1W4T4i4NwGGWMCUdaFnOUECDeiTYv6kwYDZjBUOiHs=@vger.kernel.org, AJvYcCVDRWBf1Rg2s5MOmMciFUlabTFKUWoIhP1YW/oo0YF/bDK1X0Qd5YRSfynjsHrzKs2yELMyGJAjUjolzQ==@vger.kernel.org, AJvYcCWmWjMgDdCt1U//qYx80ozubmgXykqKxunMRfS11xTT/qKwiFCYdLt5cHNrm6dF4h+VaUcIi6RihiTWaUsy@vger.kernel.org
X-Gm-Message-State: AOJu0YwVfrYf45Q3j4UToj7/ZocoopuQIcg8nMKYhAM2WOW7oh+ep7qw
	4ThRAZ8lJYjEt2C6FQPPZLFoXcdIBbOvy055zuIXiQw00jTy1q7V
X-Gm-Gg: ASbGncsqzLpV7+dCJLqO8Bdi4dFe5N/bV0q8AVckNak0XVevKY9lPjBP+Q0eG/dFfis
	4+R8u9I2qLHHb6GU/Qd5Jo4g3TODHfoDEiLVU4ytxBafFSPZjDheBZ8DPAreREPhHY5v3k3DaGO
	CNqcmcn13+v3x3iImRhaLB/ynOcWQq2V8L31YLorm2D5KOs7ahMv81gYbrkllBsU252t3A4NdMb
	uTtjMl4G5ZE7+buWf2/95t/TZlgvJ/AeA+VnMN9HOtLhwvfZmWeASlLL/iyVMe79evmHzDbpZMQ
	/qMyGCqM/GBPVM7/ElNLitEKa+G0wA2QhEx3THWk
X-Google-Smtp-Source: AGHT+IHLp9KzgklSuVccvX9+X/FnXYYpoW6Vvt8L0Jv8f//MgqxfPc7xT7yjW09MaqfRUmZaq7SqZw==
X-Received: by 2002:a17:903:1c4:b0:216:31c2:3db8 with SMTP id d9443c01a7336-21c355c3358mr316032895ad.37.1737540046022;
        Wed, 22 Jan 2025 02:00:46 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3a87e4sm92957915ad.111.2025.01.22.02.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 02:00:45 -0800 (PST)
Message-ID: <07507296-a37b-4543-97cb-0560ef7fb7b8@gmail.com>
Date: Wed, 22 Jan 2025 19:00:43 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: sfr@canb.auug.org.au
Cc: bhelgaas@google.com, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, mchehab+samsung@kernel.org,
 Akira Yokosawa <akiyks@gmail.com>, linux-doc@vger.kernel.org
References: <20250122170335.148a23b0@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the origin tree
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250122170335.148a23b0@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[+CC: linux-doc]

Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (htmldocs) produced this warning:
> 
> Documentation/power/video.rst:213: WARNING: Footnote [#] is not referenced. [ref.footnote]
> 
> This warning has presumably been there for a long time.
> 
> I don't know what causes it - maybe it needs a space before the opening
> bracket?

Stephen, fhve you upgraded your Sphinx recently?

In "Bugs Fixed" section of Sphinx 8.1.0 changelog [1], there is an item which
reads:

    - #12730: The UnreferencedFootnotesDetector transform has been improved
      to more consistently detect unreferenced footnotes. Note, the priority
      of the transform has been changed from 200 to 622, so that it now runs
      after the docutils Footnotes resolution transform. Patch by Chris Sewell.

So the above warning is real and prior versions of Sphinx just can't flag it.

To silence it, you need to get rid of the unreferenced footnote, I guess.

[1]: https://www.sphinx-doc.org/en/master/changes/8.1.html#id3

        HTH, Akira

> 
> Introduced by commit
> 
>   151f4e2bdc7a ("docs: power: convert docs to ReST and rename to *.rst")
> 
> from v5.3-rc1
> 
> I am just going over left over warnings in he documentation.
> 
> -- 
> Cheers,
> Stephen Rothwell


