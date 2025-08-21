Return-Path: <linux-next+bounces-8063-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3661B2F7BC
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 14:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 214741BC3BEA
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 12:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2B03101BF;
	Thu, 21 Aug 2025 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UQcg3t+6"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E26C30FF09;
	Thu, 21 Aug 2025 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755778790; cv=none; b=Mi4TBBUAVu2UNi3NZEgroQ62GIMAmevFEysnYOkuP/jyfdBcYMoQMr7/oX1XN++KqtrYHH3N69K8ezzH5NQBtP2tZcMNso+qgKuXkbs8X2g4kLfPPbzbK9TouCDZ4LIMSC4tiD2Z0/mSz1KiDhiPUNpft+fOY2oo6nI4fusBm9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755778790; c=relaxed/simple;
	bh=WogvDi0r85d7kj4DsfJxqY9POVZ7xh8jiErYhA/jon0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glA9fvRTalL6rp7129OqLK5BFFKaX70Ueh0icPVsArcIh6eH93hdEGWVAwiFwrGTGXWk1+li0HAsYrpzUx7sAMpY1JXpC65Oqxpper0/tonHLXzEhPySCXLWzv5VMqgw3M5UuA4JjvchFpX5GMDHtnBCNBoEKKxcLCsy9aE+Dvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UQcg3t+6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D223C4CEEB;
	Thu, 21 Aug 2025 12:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755778790;
	bh=WogvDi0r85d7kj4DsfJxqY9POVZ7xh8jiErYhA/jon0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQcg3t+6Oq0Gnwjfg6zo5Qz9jY49O7XuYQskyEZxpMyh95MW8MQ0PeSHTzlw6pIAE
	 rddukuDZg2Lar/PVmhOWRp0cvmA7yc3djlIQKfSUXA5EZgnCHbUGUAi7D+LMt9f5rR
	 nrbcYp3Y45HLrG3NVXdOqMZugwSMXN5+Y1+zOT3g=
Date: Thu, 21 Aug 2025 14:19:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Li Li <dualli@google.com>, Tiffany Yang <ynaffit@google.com>,
	John Stultz <jstultz@google.com>, Shai Barack <shayba@google.com>,
	=?iso-8859-1?Q?Thi=E9baud?= Weksteen <tweek@google.com>,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Todd Kjos <tkjos@android.com>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>,
	Martijn Coenen <maco@android.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v20 3/5] binder: introduce transaction reports via netlink
Message-ID: <2025082145-crabmeat-ounce-e71f@gregkh>
References: <20250727182932.2499194-1-cmllamas@google.com>
 <20250727182932.2499194-4-cmllamas@google.com>
 <e21744a4-0155-40ec-b8c1-d81b14107c9f@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e21744a4-0155-40ec-b8c1-d81b14107c9f@leemhuis.info>

On Thu, Aug 21, 2025 at 10:49:09AM +0200, Thorsten Leemhuis wrote:
> On 27.07.25 20:29, Carlos Llamas wrote:
> > From: Li Li <dualli@google.com>
> > 
> > Introduce a generic netlink multicast event to report binder transaction
> > failures to userspace. This allows subscribers to monitor these events
> > and take appropriate actions, such as stopping a misbehaving application
> > that is spamming a service with huge amount of transactions.
> > 
> > The multicast event contains full details of the failed transactions,
> > including the sender/target PIDs, payload size and specific error code.
> > This interface is defined using a YAML spec, from which the UAPI and
> > kernel headers and source are auto-generated.
> 
> It seems to me like this patch (which showed up in -next today after
> Greg merged it) caused a build error for me in my daily -next builds
> for Fedora when building tools/net/ynl:
> 
> """
> make[1]: Entering directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/lib'
> gcc -std=gnu11 -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow   -c -MMD -c -o ynl.o ynl.c
>         AR ynl.a
> make[1]: Leaving directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/lib'
> make[1]: Entering directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated'
>         GEN binder-user.c
> Traceback (most recent call last):
>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 3673, in <module>
>     main()
>     ~~~~^^
>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 3382, in main
>     parsed = Family(args.spec, exclude_ops)
>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 1205, in __init__
>     super().__init__(file_name, exclude_ops=exclude_ops)
>     ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/pyynl/lib/nlspec.py", line 462, in __init__
>     jsonschema.validate(self.yaml, schema)
>     ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.13/site-packages/jsonschema/validators.py", line 1307, in validate
>     raise error
> jsonschema.exceptions.ValidationError: 'from_pid' does not match '^[0-9a-z-]+$'
> 
> Failed validating 'pattern' in schema['properties']['attribute-sets']['items']['properties']['attributes']['items']['properties']['name']:
>     {'pattern': '^[0-9a-z-]+$', 'type': 'string'}
> 
> On instance['attribute-sets'][0]['attributes'][2]['name']:
>     'from_pid'
> make[1]: *** [Makefile:48: binder-user.c] Error 1
> make[1]: Leaving directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated'
> make: *** [Makefile:25: generated] Error 2
> """

Odd, this works for me.

How exactly are you building this?

thanks,

greg k-h

