Return-Path: <linux-next+bounces-2663-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E8191625B
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 11:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4970B1C20FA5
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 09:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B27FBEF;
	Tue, 25 Jun 2024 09:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CjQag9rL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9096A1487D6
	for <linux-next@vger.kernel.org>; Tue, 25 Jun 2024 09:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719307949; cv=none; b=dxA7prDQQZBOvuIM+hjxZk8knvhDO1uvm9PdVkaGJ9ezX4MoP94KhwoODz2/EKrm+HD4jvOlZqay23qsJCaB9azvZvb5xZ0g7ymifYdDYe8x1qxIzqlGJIOjtXShwNmtnMImRZZUGpEgPgCUPklRa3keUsT7fDZ64HYjwrHfAFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719307949; c=relaxed/simple;
	bh=wv1Mo3WswpKUsE73KC474IURZEDnsXQjgmzkuzSb0eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mA4RHtFIOUuyFkc1k3Vxf02KQfDecJbYGGc9cp5Ce6+ThwTu4Xo60DO4S0CbVbJ/LlpzRxthygBrGUu9B34v4Bq51bu2btz2H4Lk8e2lZeoqkb1tbk+/l3QmLwDW7pzR24BSdOZgab4/fH2vT9C8/URRLFQ5Dzv74cL8nga9jFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CjQag9rL; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ec5fad1984so28661601fa.0
        for <linux-next@vger.kernel.org>; Tue, 25 Jun 2024 02:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719307946; x=1719912746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DqshuwDrjdoXUHKKVyNi7MkOthDOzOvgWLrkKM4nxgw=;
        b=CjQag9rLBHxGWG4DiiwdhpbjIHXla/vvX44MQ9w+y4r7HKmwiYEXZEiVOOg1z+7abb
         01EXIbhbGXqlUqF3cHMKkZu7nBPGB/5MHm7pjPj8OA0Z4GaAV2g5Qm7gy2SUCPeTQFU7
         c2GSmqkd4dRDom4ndv0lVpgrIufqygwq3KRws1HdEikPqAVXEG/LEqJPjzHFgxdeZCuS
         wffym17tK7rim08AOhVguUD5eDrv7/VgGrZZy2iws2UjjF+k3T/uOBHZtYE3ixLGo6jH
         +N7Q4hgqeaDW7Jd4S4Q0SjgmHahw2cklmjh411rN8WwPdamCOfCSit1afeK2ZQdMVsz5
         ZDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719307946; x=1719912746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqshuwDrjdoXUHKKVyNi7MkOthDOzOvgWLrkKM4nxgw=;
        b=p4vJm9Ag7M1X4QW3pgSoiGHZuTazsJn6LqXDHjplxHiwPgT57isYGOyTSSBA9U3bc3
         XSBkClBjDCr7Rz/XRExBns659NMeLMOXtm7nG6rEVzFPShNS8vW+DewMPSqLr4k21vhg
         hfGfjz099qxovqcIgAFJF62fsticwU8O6drPl8JwRJULg2RGVXA0sDg1D1yRKZTyqyF2
         EB0raZLs3z5khzNSsPZFzSetDmDeWciysrZ+OukrNsBZ72SQ1x/HS4aSSaS3TXZRvspC
         cyqLm+CeK6rDep5opydWrJBiJZAEMGZMKjCFnHzEfy5e9CnXoOn7fEYAC5eA56faT9S3
         khUg==
X-Forwarded-Encrypted: i=1; AJvYcCVTi3SYehF6Dqd4LSD2cGez1YL1Zo+CcKGgA7UbCzyTmYejKwbmwdEDe+4+fj9jGqqwwWXDBGRGu9iUfgGf3Ce2iuNpxiWk10iFqg==
X-Gm-Message-State: AOJu0Yz2L4yBaHul7SxBHqVHdvzzI649ElrqCJ2R0JNZATJ+h1/3RO49
	yohrKF9bN01LkvfrADkGudrxrrbylwMLN0YN3/u7GMLhWdIWcruFHE+SUZ3Ud2c=
X-Google-Smtp-Source: AGHT+IFsd4DsX2vKsfBhM47QP/hfmLV2dDS7lLtGrUFPiJkrN4N+bXqwZ4Ebe+haoZ1gZcv0bVpmFA==
X-Received: by 2002:a2e:9684:0:b0:2ec:507f:7319 with SMTP id 38308e7fff4ca-2ec5b36a98amr55201981fa.43.1719307945815;
        Tue, 25 Jun 2024 02:32:25 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819dcf158sm8196671a91.53.2024.06.25.02.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 02:32:25 -0700 (PDT)
Date: Tue, 25 Jun 2024 11:32:16 +0200
From: Petr Mladek <pmladek@suse.com>
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tony Lindgren <tony.lindgren@linux.intel.com>
Subject: Re: linux-next: manual merge of the tty tree with the printk tree
Message-ID: <ZnqOoGjy7nAiV4MW@pathway.suse.cz>
References: <ZnmwwfMH50s9LiT5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnmwwfMH50s9LiT5@sirena.org.uk>

On Mon 2024-06-24 18:45:37, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   drivers/tty/serial/8250/8250_core.c
> 
> between commit:
> 
>   b70dc67cceb97 ("serial: core: Revert unusable console quirk handling")

I have just removed this commit from the printk tree.


> from the printk tree and commit:
> 
>   ffd8e8bd26e94 ("serial: 8250: Extract platform driver")
> 
> from the tty tree.

There has been a race between the changes in the printk and tty
which has caused these problems. [*]

The conflicts between the printk and tty tree should be gone now.

I am sorry for troubles.

Best Regards,
Petr

[*] In fact, I have removed the entire patchset fixing the regression
in console registration, see
https://lore.kernel.org/r/20240620124541.164931-1-tony.lindgren@linux.intel.com

The feature is going to be reworked. Greg has reverted the commits
introducing the regression in the tty tree, see
https://lore.kernel.org/r/2024062551-hubcap-bauble-fae5@gregkh

