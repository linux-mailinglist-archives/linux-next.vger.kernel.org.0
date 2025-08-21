Return-Path: <linux-next+bounces-8067-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7134B2FAF2
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 15:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 413F5B61998
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 13:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6A92DF705;
	Thu, 21 Aug 2025 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n5pFRIfr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0262DF710
	for <linux-next@vger.kernel.org>; Thu, 21 Aug 2025 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783543; cv=none; b=gth4uqwAz016HPqE9sVhL3ns03u6Dnc/Y3nFDcDAtOPRLeqv1/oCPcu45qC8c+u6bqasbafTlEqX2jg19acfbLtIT5vF5u5Mym3q8KRjR6EsGgY78H5u8FIwzl1dWit826j+kJ1uHM28u3g4oKlBL0DP0mloYIij8eHm0C8t8ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783543; c=relaxed/simple;
	bh=UBaomgbe5Pto6k9s8jcQN8o0bdH3iMYe1oFhKjAp01M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5H6GhDWJe4auLUeNDpR18diL0Slw3jVmHukl6UrdisN1KLFxWVDsuCSyrXpHu1BI7NVkjZs0KiISny5Ih9ZSEZStT/mPvHh//6rQisCpIMabtMApVfh1v9wh5sKewcXhZM8cDDq8qy1baUXZwSMQBto2mcnI5z8EDdOoVRhZB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n5pFRIfr; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-246013de800so137755ad.0
        for <linux-next@vger.kernel.org>; Thu, 21 Aug 2025 06:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755783541; x=1756388341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7N9rAjjjlmmVnsb6lYyZUzYXQ/m0Q5K6qvsrUkhsgXc=;
        b=n5pFRIfrtJN7JZMXIcg9FomDpqXm35VXUOT0hHV/Me6jKlY0VGZ6heo6dKmBQtWU7d
         9bw5evGgGCIQmKNMxyqbBxGDt87FjTTovsleJabaYL0nDPksutu1SF8GB/F4RtzIkHry
         GtjiW4h88UiidARPei+Tz2CwcX4eA6iIh+hJcZNorbPgyZt/R5rXN5dMbs8m+RF+vWpc
         S/IVfFbU5QkJ0co8umVuGSWm1i2/p9/FmPX0rhniYXWJ16s/qPu5v+0xYZdxML6sF503
         l/GDYJ81+nZHoZqFThJxolc3FLAZDlJsshBfAm+vO5jc42Hg3ofoS6L8+rlsx5C9pQH1
         XLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783541; x=1756388341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7N9rAjjjlmmVnsb6lYyZUzYXQ/m0Q5K6qvsrUkhsgXc=;
        b=UTL21KNTUWgY0zPXdc2TilwFRMMuBNW/NW904sh1jG8judrRF+Sx/PdwO0pSxj/G+d
         o0GOCoICzSGXbGLhWkyo0w8FI7Uqt3D9iQda6OtmK4tXg0MrKVFyGwq3jjQ8tPzXA6en
         fh9odvjgLKPDmIavDfNGdC2Ng5g06OO803Aqri/O1oTHEfVqmqG6kWRspQGXrQgO1NRc
         RS5h1uQqoK60PqssM/yqrSXgARJf6i+lug/2CGgRdunmi2tRvxdFZU0PolRSWkEZmEzR
         09jA1oKtP+iDWn/RjueCLREjW/zoWZT4Z0QKFNXKo2PE9ifzxctWXalXnE9z25bH3Mya
         /Reg==
X-Forwarded-Encrypted: i=1; AJvYcCWXaKhqjY9ods1DKmfgi9jIqRVcZpkfNU100WO7IOb164nbIXQgwchF1DIFc70kjY/qBR1DMM8YicLc@vger.kernel.org
X-Gm-Message-State: AOJu0YxQl10VvzIQ+jeN9SSC8KDncMox20/Ei4M88MPKnGRHLasLO6I4
	V9LeRTJQKuRYAdClxWDupahkmncPfCRQBnH1tIXz3t4wkcFcWQDWgSEcKOe6KIuToQ==
X-Gm-Gg: ASbGncuaiDWeCm0N1uop3WmAEc1yOiBdjPhsB34JR+KTwESyfmsw+dPUQ0hTk5WsZ1X
	UnCUNrn2itZjh3VISa7PFTDaXH2iO4oiNT7fQcYArAOK0hdUpGr5BtKPsCHRosuySKWrHyD9JDl
	T973OVNWvg+xmswT/D8tur9ekuAUGJtuNdGCojniHedgG6jsmSZyq/2cSDz9cy/6L+uyg5BhJEq
	TaktV74ek17GK3IrKKMiun33cgIhD12kCY+TGJziIR1ii4nTV7uAOF41aN5aRINfsFWsmF/kxKA
	TdKXmViyRqcu7XfNcOr8uFL5zD43hCBmEMqgKS8i9JG09YA7V6t4vwWNBfd4LuoZYz4lIO8JNR5
	wOkYqrgrN16VPyn8n2qA4SLlT2vSWh21IMVf6DiUT4xvWjOFroi4zIYsZq1q2ig==
X-Google-Smtp-Source: AGHT+IEC07DRM954ZauhrF271W70UI0dmUDeDFMbKiMegLnkkgTzAWcZdd3XdKKaCxDubRNrmCtS1g==
X-Received: by 2002:a17:903:22d2:b0:240:a4b5:fe0d with SMTP id d9443c01a7336-245ffa5b6cbmr3398745ad.6.1755783540818;
        Thu, 21 Aug 2025 06:39:00 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fb85e7sm4806942a12.12.2025.08.21.06.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:38:59 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:38:54 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, Li Li <dualli@google.com>,
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
Message-ID: <aKchboXyR1oQDV_e@google.com>
References: <20250727182932.2499194-1-cmllamas@google.com>
 <20250727182932.2499194-4-cmllamas@google.com>
 <e21744a4-0155-40ec-b8c1-d81b14107c9f@leemhuis.info>
 <2025082145-crabmeat-ounce-e71f@gregkh>
 <ddbf8e90-3fbb-4747-8e45-c931a0f02935@leemhuis.info>
 <2025082120-phoney-husband-d028@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025082120-phoney-husband-d028@gregkh>

On Thu, Aug 21, 2025 at 03:25:59PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 21, 2025 at 03:00:50PM +0200, Thorsten Leemhuis wrote:
> > On 21.08.25 14:19, Greg Kroah-Hartman wrote:
> > > On Thu, Aug 21, 2025 at 10:49:09AM +0200, Thorsten Leemhuis wrote:
> > >> On 27.07.25 20:29, Carlos Llamas wrote:
> > >>> From: Li Li <dualli@google.com>
> > >>>
> > >>> Introduce a generic netlink multicast event to report binder transaction
> > >>> failures to userspace. This allows subscribers to monitor these events
> > >>> and take appropriate actions, such as stopping a misbehaving application
> > >>> that is spamming a service with huge amount of transactions.
> > >>>
> > >>> The multicast event contains full details of the failed transactions,
> > >>> including the sender/target PIDs, payload size and specific error code.
> > >>> This interface is defined using a YAML spec, from which the UAPI and
> > >>> kernel headers and source are auto-generated.
> > >>
> > >> It seems to me like this patch (which showed up in -next today after
> > >> Greg merged it) caused a build error for me in my daily -next builds
> > >> for Fedora when building tools/net/ynl:
> > >>
> > >> """
> > >> make[1]: Entering directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/lib'
> > >> gcc -std=gnu11 -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow   -c -MMD -c -o ynl.o ynl.c
> > >>         AR ynl.a
> > >> make[1]: Leaving directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/lib'
> > >> make[1]: Entering directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated'
> > >>         GEN binder-user.c
> > >> Traceback (most recent call last):
> > >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 3673, in <module>
> > >>     main()
> > >>     ~~~~^^
> > >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 3382, in main
> > >>     parsed = Family(args.spec, exclude_ops)
> > >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 1205, in __init__
> > >>     super().__init__(file_name, exclude_ops=exclude_ops)
> > >>     ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/pyynl/lib/nlspec.py", line 462, in __init__
> > >>     jsonschema.validate(self.yaml, schema)
> > >>     ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^
> > >>   File "/usr/lib/python3.13/site-packages/jsonschema/validators.py", line 1307, in validate
> > >>     raise error
> > >> jsonschema.exceptions.ValidationError: 'from_pid' does not match '^[0-9a-z-]+$'
> > >>
> > >> Failed validating 'pattern' in schema['properties']['attribute-sets']['items']['properties']['attributes']['items']['properties']['name']:
> > >>     {'pattern': '^[0-9a-z-]+$', 'type': 'string'}
> > >>
> > >> On instance['attribute-sets'][0]['attributes'][2]['name']:
> > >>     'from_pid'
> > >> make[1]: *** [Makefile:48: binder-user.c] Error 1
> > >> make[1]: Leaving directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated'
> > >> make: *** [Makefile:25: generated] Error 2
> > >> """
> > > 
> > > Odd, this works for me.
> > 
> > Hmmm, happened on various Fedora releases and archs in Fedora's coprs
> > buildsys for me today. And with a local Fedora 41 x86_64 install, too;
> > in the latter case (just verified) both when checking out next-20250821
> > and 63740349eba78f ("binder: introduce transaction reports via netlink")
> > from -next.
> > 
> > > How exactly are you building this?
> > 
> > Just "cd tools/net/ynl; make".
> 
> Odd, this works for me in the driver-core-next branch, but in linux-next
> it blows up like this.  Is it a merge issue somewhere?  I don't know
> what this tool is doing to attempt to debug it myself, sorry.
> 
> greg k-h

The commit enforcing the restriction on underscores is:
  af852f1f1c95 ("netlink: specs: enforce strict naming of properties")

I'm able to reproduce the issue locally now, and switching to dashes
fixes it. Sorry, I was not aware of this restriction but I'll send a
quick patch to fix this.

--
Carlos Llamas

