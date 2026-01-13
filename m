Return-Path: <linux-next+bounces-9645-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF646D1B5EC
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 22:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 382523034FA8
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 21:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34465332EC7;
	Tue, 13 Jan 2026 21:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="VBKD4V4V"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887FC32B99A
	for <linux-next@vger.kernel.org>; Tue, 13 Jan 2026 21:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338954; cv=none; b=ibZyfxBIzDf+qYzmkACiZxGOQ/3hpPRTIGHFRQMyVPehgib+bXyzVgoQ/L/lUX/WYzy6v1DOxKIscOousAhwZD+8HjvFANXZfvHmd/hDoGJv7sXuLrEnW1heHfgze97RCJBw/boVEzlp26ZfsNVJddudRSJdtI8az9KVU60GE+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338954; c=relaxed/simple;
	bh=lSiT+5f78IAghqqameTuBM0ImkHpqh4OyDDkmFOfoGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rV9BwkfjQGW7RRLN0jVtU8yzhuxBeYbzQUkOXC2ESmBxOhCJbtZVUhTfPWZhouDlC2RHzLVj0TT0FMjWeAUVUTeLksxb/r9TXBGnkaX7wAzlZaHC+a17c1lUt46n3sMOiZDY1lBo6iHqhZBCl8vxaxgAI4wQrF03IH/+cwgryE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=VBKD4V4V; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50146fcf927so1951981cf.0
        for <linux-next@vger.kernel.org>; Tue, 13 Jan 2026 13:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768338951; x=1768943751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8S7FI6sNOOKEC+zXX9NqKGAvEksfTGrqIkrYgB7KQ6g=;
        b=VBKD4V4V3IUsGc39ZQAuz2lUAIyDs4KH3zvLjxY/gSnR8Ss7arqwupeQdEjosZ2/un
         SwQidMYDt09X7I/4+xVcWppAbrQmswgVXIQ8GbnYHNeXVAlcZz7v6GWy28Mt+d1mi6GG
         ZJkWLdQYqBaaj7y7OrPWBAAxwdbQLCh7hKx7givQ08q0o8mRCqFQOJvPF1/LwOMCQ49a
         kfX1kTteTiD2C5Oymg1tVez3uwJW4qs7YuPQ71ZItFh5QNxH1+tIcG27NgUCId88v3mD
         A2+HcoO2o4f7AsOeB+HefNGlKXj3Pf/FwyszOtZ5N1TqqoA+qEEoB0GfdFTdrb3wcqVv
         BbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768338951; x=1768943751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8S7FI6sNOOKEC+zXX9NqKGAvEksfTGrqIkrYgB7KQ6g=;
        b=eD9Jb5Yfxlo9HZLGPdHRfFoqNRpYxIDkcy/fPnNYjYAS05OQWq6gTKZXwRs1qggvvM
         bZDOvjHKQ5S1PYPolKerItLB0Dq86j1tsgRGseure7BErgp1hhuG+UpsY//2K+0JYhaW
         vxRCnZEB/8JygNFcGQXCnYxJtuU9n0pNXlAzTv9NIdTGDmKPQDwZ7FvpcSK9bvxO2xLF
         JpftxksqLLBjDQvuMkLaSxlUhnNyLmxw1Psq7sQnw0i2r1C06Z5iSFfiky7QmsbynfPm
         GzCdPvQkFrkdAe4e9d77KQMqdnRKUPlnoLoflI9Dj6FaZ7ZwB0PISHcJN/vjBAUOD8kT
         G5oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkjCUjHHo1HHbtMtsStfLIWspjig0RI//ZoyJw7FffNRr6Qwf9RXLePLjDdOT9DIm4INpOjolNk9Dk@vger.kernel.org
X-Gm-Message-State: AOJu0YzskWSy1by03z372cVNk7q1qGitWf/c9/tadTeDjtFxi0GlaB8i
	KMwuakAtDG4F7BgI+FTEcG/rxJ2BNuTfMxva3d9seJgF12E96tQxXYLrbghggShcY1A=
X-Gm-Gg: AY/fxX7tgzVP6YbjVIkt+ws/9VuHV4digvpU/hSWCC8HBmE6FDTZzkCmE9fMyVSxOQi
	IINcpwFY8wV4I91yeROTWw0VWLujJ1VPPqPaFJLyd7wEDeTGjPM2Wn0ErnnzEXakle5ERmQxKcu
	I8ya289PdapSSR7mnUzsytrokGazig49Y6oOFJcN3Xmk9++j4rSCTiNvScwnCUMxkWntlxkEGWD
	94USe+hbUNYTOWEMYVmTCyzlB/KvVO4DpFm7PHnmSY9HOgsKQ2CVaiBbA3eraiEgVM3DaHOSBaR
	2sHFo4YYFDVHc57JdkqMP01X8kgfjGZTaqH4XYtCSPsWEmlTjEiyqndL6l3I59Bfk6/xiaQh2OO
	oRci2KdPm8YlH6sSewU93hU8Q1kgmzDVlifxL7iDQBBCPAj2gL62Rtuewc+26CeJP58c6i5vs4X
	gIrb6Xz+7YN7QZE3Mtf//oEOLKASPrSfzjwsMbY49tK9INbvgZYhdaC8m9qMv4dC3/0co=
X-Received: by 2002:a05:622a:19aa:b0:4f1:de87:ad90 with SMTP id d75a77b69052e-5013972ec7emr56793941cf.4.1768338951296;
        Tue, 13 Jan 2026 13:15:51 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772682besm164113626d6.50.2026.01.13.13.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 13:15:50 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfljw-000000040dN-3h50;
	Tue, 13 Jan 2026 17:15:48 -0400
Date: Tue, 13 Jan 2026 17:15:48 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Bert Karwatzki <spasswolf@web.de>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	regressions@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Yury Norov <yury.norov@gmail.com>,
	Anna Schumaker <anna.schumaker@oracle.com>,
	Baoquan He <bhe@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
	Dave Young <dyoung@redhat.com>,
	Doug Anderson <dianders@chromium.org>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@kernel.org>,
	Joanthan Cameron <Jonathan.Cameron@huawei.com>,
	Joel Granados <joel.granados@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Kees Cook <kees@kernel.org>, Li Huafei <lihuafei1@huawei.com>,
	"Luck, Tony" <tony.luck@intel.com>,
	Luo Gengkun <luogengkun@huaweicloud.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	Nam Cao <namcao@linutronix.de>, oushixiong <oushixiong@kylinos.cn>,
	Petr Mladek <pmladek@suse.com>,
	Qianqiang Liu <qianqiang.liu@163.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Sohil Mehta <sohil.mehta@intel.com>, Tejun Heo <tj@kernel.org>,
	Thomas Zimemrmann <tzimmermann@suse.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>, W_Armin@gmx.de
Subject: Re: NMI stack overflow during resume of PCIe bridge with
 CONFIG_HARDLOCKUP_DETECTOR=y
Message-ID: <20260113211548.GV745888@ziepe.ca>
References: <20260113094129.3357-1-spasswolf@web.de>
 <87h5spk01t.ffs@tglx>
 <bc20529d7520e7db7de2022bf9c96a1bc3a2f0df.camel@web.de>
 <87v7h5ia3d.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7h5ia3d.ffs@tglx>

On Tue, Jan 13, 2026 at 08:30:46PM +0100, Thomas Gleixner wrote:
> So gradually your machine just stalls on outstanding MMIO transactions
> w/o further notice... The NMI is just a red herring.

CPUs usualy have timeouts for these things and they return 0xFF back
for the timed out read. Beyond that "it depends" if any other RAS
indications are raised.
 
> You need to figure out why that MMIO access to that device's
> configuration space stalls as anything else is just subsequent
> damage.

Given this is a resume it seems likely the PCI routing inside the
bridge chip has been messed up somehow during the suspend/resume.

Possibily due to errata in the bridge, there are many weird bridge
errata :\

Jason

