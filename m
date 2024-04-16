Return-Path: <linux-next+bounces-1953-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D208A7964
	for <lists+linux-next@lfdr.de>; Wed, 17 Apr 2024 01:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F262B21273
	for <lists+linux-next@lfdr.de>; Tue, 16 Apr 2024 23:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D8B13AA2D;
	Tue, 16 Apr 2024 23:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gtwiBh6O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A528713A3E8
	for <linux-next@vger.kernel.org>; Tue, 16 Apr 2024 23:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713311774; cv=none; b=jC4ecU26lFmemFS2S29JLJ+Ls/ItymkNJMqrlZ1mkQlgOeWLQ5XCe4XqzmvDUUNwRYdFvNEKSPkyFQvWwP20faUoxCykE7O/x4J2Jj7+VRR6RBZ3HrDwm3ziB3gR7ndn+Eb3xdmyRoIEQSIzV7suS6nUMxh+8WYwqA8bnmd44ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713311774; c=relaxed/simple;
	bh=rwJftUeU/lbuNRsOtZmgiInugjY1VkK+eRR7xa/Txy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKrMHO0KeNMYMEVCKjWOaZwxMKlAqS0JiKWdHQyf49N9SLOl8HrC97WUKPK6eOyjxOJJJ+G5PIFCVTaBWpqLS8m4Ezq4tDKCF9S8nDgjjmZPKBZIPkYAYF4KhVBWx6nNFwTK3XXo92eQIMLl8pfw291kK+zvHzG87z/mlM8qXk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gtwiBh6O; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7d9c78d1087so12325239f.2
        for <linux-next@vger.kernel.org>; Tue, 16 Apr 2024 16:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1713311772; x=1713916572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20k6hAYpVVcRpxhrJeU7g8eIaqwNO+HIAqzC4kADoz0=;
        b=gtwiBh6Ohk1BLPmB8zKJBf1hUbJa9O1Mk7Iut6Bccq6AKiboHul8blHaQaOh95Emqe
         lRpkvxFMZvycKM5uweEP5fRiYULyCautOIBWZxX9I+aIeKa+4IQwt1EIw9s8Duk95UNM
         jxbX/kZ0woSa8PmJQhNg6Nj/2KzLK6LUgica4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713311772; x=1713916572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20k6hAYpVVcRpxhrJeU7g8eIaqwNO+HIAqzC4kADoz0=;
        b=nF37mXmdu3UIIe35hBHgO86BQFylUjlSXc2r5sLdWGELfnCHXFgxn4mHwML2HkDkLK
         jPukaRT3QQ+Ub6XaKynbgqHRBuEbqlTOE5pEduyN5wF58IKiPS7QppDttOKOt3qK35Gp
         6Y/v36GoQa7WQmlxQqtnjllx6lbhWK/JDgDGw1r3sGJfxuWzbGX+Hu9I2mSbRYDu28lP
         s/zO8txWHBY6iOB/QSE6cJuJTGS/jqjU9wnGpYJY5z4FcuLyjNQ6snzuv3LencNIEHRx
         6c/6ksM6DHWbolgvqHgZpgsjhUD/nwM0bfXtqiS2xCjh7jO6Wgo4iE564UzeYElqAunV
         XyDA==
X-Forwarded-Encrypted: i=1; AJvYcCXDItLTe/CSGcBGlsFphEFvLNxKE8ISYy/59O0sVim4OYhuNPLG1Kxj2nx5+cJNIY73b+Vj0geapdJYpliabOUaR4mbySGxV+lZyg==
X-Gm-Message-State: AOJu0YwrMqbrOaRCgW+OeTLf2xo4PH+/jOlikiIZB3Aq2anOmw6yXkt6
	u4sDKeWS9dp1iyFnvhe/BTEn2m+NPjjnqzTxRxHg1qCwRPLimhafDm3BPKusFvMP7i8Vjij7JN3
	W/dQ=
X-Google-Smtp-Source: AGHT+IFOvVxAAgDDGF0ZqJGKKI+J9AoZavpdV8gOREBSQGxb48v1ml8uaagqeXHKHxh05hbwU9/vXg==
X-Received: by 2002:a92:2c0d:0:b0:368:efa4:be12 with SMTP id t13-20020a922c0d000000b00368efa4be12mr12905023ile.3.1713311771784;
        Tue, 16 Apr 2024 16:56:11 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id l20-20020a056e020dd400b0036b34c1b30fsm114056ilj.43.2024.04.16.16.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 16:56:11 -0700 (PDT)
Message-ID: <eb963531-14ab-4bb3-be54-fe175b97df4f@linuxfoundation.org>
Date: Tue, 16 Apr 2024 17:56:10 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the kselftest tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Shuah Khan <shuah@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <skhan@linuxfoundation.org>
References: <20240415143901.578b3b4e@canb.auug.org.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240415143901.578b3b4e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/24 22:39, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kselftest tree got a conflict in:
> 
>    tools/testing/selftests/kselftest.h
> 
> between commit:
> 
>    f7d5bcd35d42 ("selftests: kselftest: Mark functions that unconditionally call exit() as __noreturn")
> 
> from Linus' tree and commit:
> 
>    5d3a9274f0d1 ("kselftest: Add mechanism for reporting a KSFT_ result code")
>    f07041728422 ("selftests: add ksft_exit_fail_perror()")
> 
> from the kselftest tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Rebased to Linux 6.9-rc4 and resolved these two merge conflicts
in linux-kselftest next.

thanks,
-- Shuah

