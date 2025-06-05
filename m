Return-Path: <linux-next+bounces-7066-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 026BAACECA0
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 11:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80605163C94
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 09:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE742063FD;
	Thu,  5 Jun 2025 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Mpjw853b"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E34F1F4C90
	for <linux-next@vger.kernel.org>; Thu,  5 Jun 2025 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749114721; cv=none; b=SECiCvi0HbULNS8WDhVS4nFkA5wTx/0ui4rAHhF0R2VjwakjXlFdBOnrKEdwuwj+kiEmAUA+pNmq+IBjYEtkpIWt2qxY1meQmZlXRrkfIeGFqJ0X1MRALv7XOXwNNIG4hf1hiePsXlKaqdc0wJAzfZwUO3n+y29N7LSerV5sUFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749114721; c=relaxed/simple;
	bh=G8kQVo9kZRVl4z1fCLT77N9XWV4CaD4IIzyLf31CqNw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLQi/2xiFpF0mHFZnW8W6p91NYswz55I+jB1jsHkQsyv6MwulPZB5dWznDo26rLfAraroUedkCeaodYLNSoVgNGYV8EGaA6ZMkGWppFwChClKV+U5nlEM8bA+b9dcjLl6VzQFVsJn8mBOkB+k8AnjFWicZcULgQq1k0pOkrnkhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Mpjw853b; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-604f26055c6so3784918a12.1
        for <linux-next@vger.kernel.org>; Thu, 05 Jun 2025 02:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749114717; x=1749719517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGXviXZa4fv0rKqlJANWxK6jWt62sKeWC9rdavPKx0k=;
        b=Mpjw853bY0PpGki3cB6Pe4tKR3DhSFlZdRH2d3IL06knTdqBK79KmiWxedh8RV9x+k
         ENAynPyctziWtG1EWX2V+7XIseF1afYhHomfg2RpKod/IOMUkTKYAbKpomj/Gca+Svyh
         TpflPEKe6g5ghcO0pwEoDjKwh0zKM4B/Mh8XCpKZxXySPx6b0d3+BXPBRw2ubMAzVC/5
         JJ0kXtttAE8OwCU/DZ02GZPGBqiB0NiqZ0T10GNNMtVpIUkFcGJmZj2d0JgL1LkPKwE1
         zz6ileG97EJxuOV5TcWIoKRNmo2pz2p87bApyx3XK5PvQIJjPiiiINEW16pcuTqA06KS
         kY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749114717; x=1749719517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGXviXZa4fv0rKqlJANWxK6jWt62sKeWC9rdavPKx0k=;
        b=dX8J96m2OkOryw6+dbafYi1N5cjKl2BuaUGvvgGw44uLr8KcWBcaWfOZXBK5hibAuh
         dM9ys4RwPAAnleTCNOEvs6vRp1ATj5eWyysLl6miWuMT6icnv55Go0NZjAeQYZ9tEVHq
         5rLgfdTfFOD34JDcqV5QAo+ou0glMFP/9aVaQUpyp0hs4cHenNJdN3UMrECWHYPh7+zm
         XhHa+BD6D34A592z7I4/tt4XPkKIpdtbZSF2S0lxgatfzaJpyZhZhv/YaDYUk56d+C1r
         mv4XzYjYtyD/TQmxtY+MGexCpwd03rGtwyuv8tOS93KoLLB+bE21I18TUhcoIKnhR0g1
         +Hdw==
X-Forwarded-Encrypted: i=1; AJvYcCW1C6VBmsIoVo4IrMJb1w+IzpDaci/GJ9sDLVh+te5tdTP7Zj4s28gSNJcuPZC1DJ6nzrCJ8OeC92z0@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQTvgKggfwDsbyMwxZZqUyLXdQfiJJo5SI4g8cTuqIiJS8fn5
	T2Dk4ruhblGuMVjp4MWLEEPuI67kwvwiQxrBNdVI+ZNLqIs5rVd9fieCxNhRSS0J8Vs=
X-Gm-Gg: ASbGncvASIZRJKIcMGGDuxvZi7DQi8Tt1GORpOouNqKDY/+sbiI53cFWDuDCBQlA9aN
	A9jAjZGM83ETPWkMsLidk5NKVC2R+AxTMqJb3cxXAi3ycg8Il44s74Hj6M+Wqe+1DqC47IgC979
	x/t2idXz/4qy8R0Xuo6dQ7bigka48VhWMawBq0JKmkDwF8uT4xw9FHJ5VyFsy5+bndbdTVzbedS
	TtLDHhR1Aic1Zp8olwDQrF8mG6grsGxwrURiwARnRYomjw2ZiaNDULIAdStL10W8UZ8irQugCY4
	GQ6aBcCA7qTrUVyDF5X6R5HJIU8pvPx4JxcWoP/Oll+g28L0ZTLdb7DuwJc8w8szGiD37atycfL
	NnzWJtNxSNtbq0Z9XXpeEig==
X-Google-Smtp-Source: AGHT+IEGrnUt4umUYNEiTeNqeKeV4ar31YaPjgdpxip8tej/ukHXsFFWJmS8AyV6pNbbTkZTC/DHRw==
X-Received: by 2002:a17:907:2d0f:b0:ad8:6dc0:6a8a with SMTP id a640c23a62f3a-ade07635a9dmr240594366b.1.1749114717229;
        Thu, 05 Jun 2025 02:11:57 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3df98sm1225545566b.158.2025.06.05.02.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 02:11:56 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 5 Jun 2025 11:13:34 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-clk@vger.kernel.org
Subject: Re: linux-next: Tree for Jun 3 (clk/clk-rp1.c)
Message-ID: <aEFfvl7dAANZQuI1@apocalypse>
References: <20250603170058.5e1e1058@canb.auug.org.au>
 <cee929b0-8b09-4e6b-95c1-c4067a8c389d@infradead.org>
 <6e88587d-f426-4841-b370-b46917822212@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e88587d-f426-4841-b370-b46917822212@broadcom.com>

Hi Florian,

On 20:06 Wed 04 Jun     , Florian Fainelli wrote:
> 
> 
> On 6/3/2025 10:01 AM, Randy Dunlap wrote:
> > 
> > 
> > On 6/3/25 12:00 AM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Please do not add any material destined for v6.17 to you rlinux-next
> > > included branches until after v6.16-rc1 has been released.
> > > 
> > > Changes since 20250530:
> > > 
> > 
> > on i386:
> > 
> > ld: drivers/clk/clk-rp1.o: in function `rp1_pll_divider_set_rate':
> > clk-rp1.c:(.text+0xba1): undefined reference to `__udivdi3'
> > 
> > caused by
> > 	/* must sleep 10 pll vco cycles */
> > 	ndelay(10ULL * div * NSEC_PER_SEC / parent_rate);
> > 
> > 
> 
> Andrea, do you mind fixing this build error for a 32-bit kernel? Thanks!

Sure, I'm on it...

Regards,
Andrea

> -- 
> Florian
> 

