Return-Path: <linux-next+bounces-6605-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B33AAF85E
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 12:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C03B7B3A2B
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 10:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC181F4CAE;
	Thu,  8 May 2025 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiTnPny/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3244B1E78;
	Thu,  8 May 2025 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746701655; cv=none; b=H8MOC7q1NLhWqCBTgzrPMDwAiUlGd9w+oZBiWf0Fw4NinY9gLDkRX4xT0/9ilM69J2S6wd1FDJFed4rep3Zy85ZxgpbnSKUQz1ugSOeENPcrbuVC5lIPpQX1+Z6pV20+Y/HNrP4vIUwsHHiQWQEGEKGYgUJGla8OdQTWKUuZTpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746701655; c=relaxed/simple;
	bh=X3UksTYOVHm8B+ZOXaMzzqudmeL3PAsZDR+aV6A8GH4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=kWJ1AJI5aIoA8xOzDjVqqPuV+9NukfuPyv8cQ6z/Yk1o4licRMWa2eVz3gr8OO1Wy7/9k3gu8i4EEUbsrNnPHbTzfBAb2UzQJZdcw/Gr63lbTprrxrLXMSPhYBD/qXDJo8W+GxxLr6B3E9l2XG3PXxiPrmcKu/l2Ev0pxn6ux5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiTnPny/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22fa28c761dso4149255ad.2;
        Thu, 08 May 2025 03:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746701653; x=1747306453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEusxefEvuohqfQtlfsyFtEEHjXPJ9IrggtjDDOP+0M=;
        b=kiTnPny/gh39ZmTScxhREw0QC/74IhJPKMtuOWrc1K7GR7zbxhTxcTuDLDre11p/q5
         nRI+TAv3cWSi3c5btoVBitYqpTN21K/8NWnEWJNyeYS9WSDwzZ/1chtJdNgrjEruwiZq
         DbPKaIoRGAyevEQh5Byz37QcwmkoKVRPf4jXC/W7AUiWxIGavTI89DCzcHxnLe3gAo/x
         3pjtBFPHjQ3rmNeRfa8xDHexfGOmDqSpbkIjWMGGGEMrJCEs0ivf6cTrs2CWabsomfyo
         rHdEfO9AdAlto3NWygPqakTaYBfUZ55qLrwL8DS7GWG7bAksukGm4vBKYIQgTurlI3Ee
         sEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746701653; x=1747306453;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CEusxefEvuohqfQtlfsyFtEEHjXPJ9IrggtjDDOP+0M=;
        b=e3EKaiP2ENbGvfa0YJ8jRsDpdIXNrfhkPvt5BfMgZJgARjSk/0BvCvGYFwJMwn85dK
         DzZKORpYW4aZbDg5qN0rzjR9mbxHp/RUhOn310LHO8YohFStRj8A9+4Xb1x31nqQZ7qy
         nTScfm++cuHuF5BcjgdxpbWAEVuN3oPMFEJFRf76nBkMKBQZFz8Nck7DsaJ5ZbJL+eRb
         A2RzcwK615NeKUG9VQpVDahKlEEPXbhsvMsf8oYE6vpgKY0tLhrk3SDGRdrYLHFXUXzq
         4E2mOnjjyw0fmHu0ZCCAqRwZ5RGeYON9Zwal92+0VVc+7MKQGmFNNQLo3V8BFv4hg3Nj
         g77Q==
X-Forwarded-Encrypted: i=1; AJvYcCVY/abkREyMLYcErR1RBxu+Qc85QuWYAfD2I5eYseruKO4TBCswovfeatq2HHSHpfMAzip6ZcP4UnjJMiI=@vger.kernel.org, AJvYcCWTzKCZpMhywcThdl58tUzEufrHue1GEjGogF4/k6YdcaDOWBPrj6wcaIJeYon3k7R4PQgH88+wy5TgvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+hngPJ+NoUX54O9vZ5bJNgJXVxW6ET++ugvjyDZ1MIObMVi4s
	uoc5VlZi0Z7EYwMeKhqNmvJ15G2tXfLmsir9igerzHu2w4pDCUFz/4k9N38n
X-Gm-Gg: ASbGncs/VnP73nKPt3+97K6k5UnfkXVDPfDgQLP3wY7FFT/sGYI8EWnq5KGjaB0jlSb
	Zkj+QPdfhqUiKw1vPF81a4/1wrJlwIRtDZeIEGjX8SsVn7VkBxgGTFUsmsYDPmh0bbkk/uhWkOs
	/v/G1QJO0x7y8jU7ignn6oHGnLo3Fc4nl0EKpMRtz0OLbFeu0fgzUVPY3Ok1PjCCr3tqsy7TXiV
	9FTbqvYGJoEhaoLPpc3FvtIi+mC4zxBJ6Q0OsX0OZCG4Ggmnp/AlSS7zlbRrar+i0h6eDO5x/NF
	M4Ec2C1Ck5INQs9mqjTs3m6eayES/YBTK3yaLG/UvuojreZjir2Hohh4Po8DisKc8AQwbp3fXwM
	/l06iL+yPRVE=
X-Google-Smtp-Source: AGHT+IHka/4iLzM65cY0fw7qKKRLRgrJDhrMgH4b2rg9j9EtsdgIUjZ704FigjYt/W1FnIFNmK5ECw==
X-Received: by 2002:a17:902:e849:b0:22c:33b2:e40e with SMTP id d9443c01a7336-22e5ea1d4d6mr100254235ad.2.1746701652965;
        Thu, 08 May 2025 03:54:12 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e95dbsm109376325ad.64.2025.05.08.03.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 03:54:12 -0700 (PDT)
Message-ID: <3b35840a-7b87-44fc-8580-219ac78ad112@gmail.com>
Date: Thu, 8 May 2025 19:54:08 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: sfr@canb.auug.org.au
Cc: corbet@lwn.net, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>
References: <20250508184839.656af8f6@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge all the trees
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250508184839.656af8f6@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[+CC: Mauro & Dan]

Hi,

Stephen Rothwell wrote:
> The commands I use are:
> 
> cd $HOME/next/next
> make O="$HOME/next/htmldocs" htmldocs

Please try:

  make O="$HOME/next/htmldocs" KERNELDOC=scripts/kernel-doc.pl htmldocs

, assuming your $HOME/next/next is the top of kernel source.

I'm suspecting that the conflict resolution done in
c84724f2137f ("Merge branch 'for-6.16/tsm-mr' into tsm-next")
ended up in mismatching path names given to "kernel-doc::" somewhere.

Looks like recent conversion of the kernel-doc script into python
has changed the behavior in such error conditions.
With the perl version, you'll see a couple of:

    Error: Cannot open file <...>/linux/drivers/virt/coco/tsm-mr.c

, but the doc build should complete.

HTH,
Akira


