Return-Path: <linux-next+bounces-8065-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAC1B2FA61
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 15:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2E591C85E45
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 13:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B793375A8;
	Thu, 21 Aug 2025 13:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D182FiHl"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06A2335BC8;
	Thu, 21 Aug 2025 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782763; cv=none; b=HEDfPygh6WIGKGNnCT/ev+wvt33x5hxuw0+ps2xIILCgRhqLPKD9aeMivRh/V8bVYHYRCj8jwK6K+bpaLfFdHjIMa836yEXFuCHZb8FNyrZGBOq5WQnOuT5vUQyBhy9DBBbKqe7VbIlR/r5x+DC8r9v3QXHkj70J/DVN4r1t3Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782763; c=relaxed/simple;
	bh=GO8pJQFJ0YUKLoac5wgIzPjbn80v89bo2xx3UBW9vbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rc371Wh5VrK8khtpP0/O4GIuWRSHgdR2J+fmS7tt87aF+2oR7Bk+rNfwvRb/AZ8tXL8lC1gfMVxVsGcV1Hz/e8BhILP8Co24cxqAxkl2yqDBMH7q5QyrEo59G+U9pmzGGJt/e+RibHRcjor/qw5QoGbysb+OqftUPEjmocEPJJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D182FiHl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1337BC4CEEB;
	Thu, 21 Aug 2025 13:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755782762;
	bh=GO8pJQFJ0YUKLoac5wgIzPjbn80v89bo2xx3UBW9vbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D182FiHlRfiLy66V21/SOiXc+cGWMClHUTdfPi83FjxV1g5g6YRvJXcsGgcTvDBnz
	 a/jiyYB7cajKTb/0+K+lOEEpbvYfXm7iktzUZAOHbRjnkYQtojosj/xIiQOFUONcwi
	 nwpH8RJL3EW4WOFQNQ6q8hANBkFQaJ3K6yNzzaP8=
Date: Thu, 21 Aug 2025 15:25:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Carlos Llamas <cmllamas@google.com>, Li Li <dualli@google.com>,
	Tiffany Yang <ynaffit@google.com>, John Stultz <jstultz@google.com>,
	Shai Barack <shayba@google.com>,
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
	Alice Ryhl <aliceryhl@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v20 3/5] binder: introduce transaction reports via netlink
Message-ID: <2025082120-phoney-husband-d028@gregkh>
References: <20250727182932.2499194-1-cmllamas@google.com>
 <20250727182932.2499194-4-cmllamas@google.com>
 <e21744a4-0155-40ec-b8c1-d81b14107c9f@leemhuis.info>
 <2025082145-crabmeat-ounce-e71f@gregkh>
 <ddbf8e90-3fbb-4747-8e45-c931a0f02935@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddbf8e90-3fbb-4747-8e45-c931a0f02935@leemhuis.info>

On Thu, Aug 21, 2025 at 03:00:50PM +0200, Thorsten Leemhuis wrote:
> On 21.08.25 14:19, Greg Kroah-Hartman wrote:
> > On Thu, Aug 21, 2025 at 10:49:09AM +0200, Thorsten Leemhuis wrote:
> >> On 27.07.25 20:29, Carlos Llamas wrote:
> >>> From: Li Li <dualli@google.com>
> >>>
> >>> Introduce a generic netlink multicast event to report binder transaction
> >>> failures to userspace. This allows subscribers to monitor these events
> >>> and take appropriate actions, such as stopping a misbehaving application
> >>> that is spamming a service with huge amount of transactions.
> >>>
> >>> The multicast event contains full details of the failed transactions,
> >>> including the sender/target PIDs, payload size and specific error code.
> >>> This interface is defined using a YAML spec, from which the UAPI and
> >>> kernel headers and source are auto-generated.
> >>
> >> It seems to me like this patch (which showed up in -next today after
> >> Greg merged it) caused a build error for me in my daily -next builds
> >> for Fedora when building tools/net/ynl:
> >>
> >> """
> >> make[1]: Entering directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/lib'
> >> gcc -std=gnu11 -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow   -c -MMD -c -o ynl.o ynl.c
> >>         AR ynl.a
> >> make[1]: Leaving directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/lib'
> >> make[1]: Entering directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated'
> >>         GEN binder-user.c
> >> Traceback (most recent call last):
> >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 3673, in <module>
> >>     main()
> >>     ~~~~^^
> >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 3382, in main
> >>     parsed = Family(args.spec, exclude_ops)
> >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 1205, in __init__
> >>     super().__init__(file_name, exclude_ops=exclude_ops)
> >>     ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/pyynl/lib/nlspec.py", line 462, in __init__
> >>     jsonschema.validate(self.yaml, schema)
> >>     ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^
> >>   File "/usr/lib/python3.13/site-packages/jsonschema/validators.py", line 1307, in validate
> >>     raise error
> >> jsonschema.exceptions.ValidationError: 'from_pid' does not match '^[0-9a-z-]+$'
> >>
> >> Failed validating 'pattern' in schema['properties']['attribute-sets']['items']['properties']['attributes']['items']['properties']['name']:
> >>     {'pattern': '^[0-9a-z-]+$', 'type': 'string'}
> >>
> >> On instance['attribute-sets'][0]['attributes'][2]['name']:
> >>     'from_pid'
> >> make[1]: *** [Makefile:48: binder-user.c] Error 1
> >> make[1]: Leaving directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated'
> >> make: *** [Makefile:25: generated] Error 2
> >> """
> > 
> > Odd, this works for me.
> 
> Hmmm, happened on various Fedora releases and archs in Fedora's coprs
> buildsys for me today. And with a local Fedora 41 x86_64 install, too;
> in the latter case (just verified) both when checking out next-20250821
> and 63740349eba78f ("binder: introduce transaction reports via netlink")
> from -next.
> 
> > How exactly are you building this?
> 
> Just "cd tools/net/ynl; make".

Odd, this works for me in the driver-core-next branch, but in linux-next
it blows up like this.  Is it a merge issue somewhere?  I don't know
what this tool is doing to attempt to debug it myself, sorry.

greg k-h

