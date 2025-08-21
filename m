Return-Path: <linux-next+bounces-8066-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA6BB2FA79
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 15:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EE22189C62B
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 13:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED8A335BDE;
	Thu, 21 Aug 2025 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WjckZDPu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE8433D8
	for <linux-next@vger.kernel.org>; Thu, 21 Aug 2025 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782978; cv=none; b=KPK4gMhdDRACixKgsHhevRxZWP7teLkO34F2MYjzlGAj2Xr0Ns4rAbiTVJZAH5RsKZZ6PrprcDiGUPrrLLSd55IyRdUmGMp4Qv3ZEhLIjSDZ4Abrtfc6wXHnhaq4PZc21FrfEJG+JfkBhRR6Be6kWluwZJ5tQlHrJejdfLQXwsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782978; c=relaxed/simple;
	bh=wc5v9uTTIL728+hB7UJTKaDvwgtQwqhmi3Vl/hFU5ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdVgfhnTwVBDWtDkhZf3BkIqKR/x+9SrsGac2g4cFJUYemOij7+g9+Uc/xcm2yAJZb0bhcinhRb4Jy9ERMPHF2utIc8BnVIqQnCOHDkZ5ARAHDi2vah9uWRpMiilNs3EVguyGHontIZYIDeo5fYMjzdJom14lDBVFQXOTwqWEPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WjckZDPu; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-246013de800so135645ad.0
        for <linux-next@vger.kernel.org>; Thu, 21 Aug 2025 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755782975; x=1756387775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J13Esd7nTONrArlNpUKcH+9/JHXUHsKEy/Ib89aPaCQ=;
        b=WjckZDPuo7y3Xh8jJTXxR+MBh9aWmoKvkLNd0tcrZtigIT2fPZ2vi94ZoJMZl9dgv/
         VtoNsQPws+ioJBCOI9Y/Kmqbfd+YXVnue2vpoZH4Fv0XW5JqqdwEnoR0poRFBbLeEKn6
         ljtT5o4Q05byKB714hFG2EoUVQEx04JRW+ESAGCTmkqY/DKcloSPi9bFlsy9fSkAPnTK
         2ocCKCzcWsRXpBD5wjKi2vyO1VrVMclcC0nPaOw/p16X70FE9z3QlPhl/SjeyEDdaapJ
         aFhzYxIVeJ/TWNgk4rwWMl06bF+RDyeMS3vOMCUXZzOLkoJD1BMxoQ4fV1jAE4QuTm/N
         qm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755782975; x=1756387775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J13Esd7nTONrArlNpUKcH+9/JHXUHsKEy/Ib89aPaCQ=;
        b=wj8HkkeTZVxvAjbRnFd6aUcNQA6reE1738NVFjrtk+7jL5fU+1YrnNs0y8yOPmpUEo
         ehu+2R1s9DAZuEf6li3wZ2nh43e6UZV1LKKKJKK6/WgLgBrjAT/VP823wuof6KvqJAuP
         ePjdYs1pFiDSGAvfUWOKLP4YejWKhNvzht+POiW6wZ+0T+F7HdzDeKvU0WRPY6xyIvcc
         mhsrlB3+1YKGDelNJOQKaZBvAPJOaz8jfkGzFMKmAjEQdRR5HUxqrFzqxSKHe950pikV
         VyMT8ZEgjQmn85UNw1Rdvk3hfEMimoSIYWcXq9ykG1oD6NCPvE/6+heKnxM72XcbP9Y3
         RP8g==
X-Forwarded-Encrypted: i=1; AJvYcCVbw50zxGj/8vlPBtUbjC3mFRM854qznH65FP3EEmLeAwCdkili0S7uZzEBRLXJW9T77L0qQw25Y06v@vger.kernel.org
X-Gm-Message-State: AOJu0YynNt3xlcymovAgDGDJMqyDmHoTX2ESkfm3Zg+5Z2nNdUoH8Gmy
	pS0KcUWlfa44zlFbMZdgLDAc2VeAiV3FkF9jwb1+g2SUtTpGeBXzqXJjjiL9OL/VIg==
X-Gm-Gg: ASbGnctm3HPyWrqBq3Y4d9bcE0L5I7cvBAuHFYQFbLVYheaGZdfwVO1N0PKzG9civEk
	o8D5TTBp9D1/4j9DKBpUMxyllNg/algC0GapmbsHqmYsFNI+cmBeE7UeI0i9bOISzNVCbxeqE0V
	+uwAWq4h+2Fz4bRwOVuYTF7UphmU3WDdOmsa4thngFo8407L+MsIeFCuToVW66ic9gJHrocRgaS
	X4LQa/Nhd3pC+uVP6RvKDRRzc0mC0FRtgcgm0BYk+9VF2SbFNnj2LNenquV0VQfe8f93qwMFN/Y
	3HROf5SyIfVKDhHJW76Hm11ICY79kIlxa5il8yh134SdrYq2UPferoUGuHiBD9MmjLN1VCAFK57
	SSI8VkYDrvyWW4SSgJ4gJ6RainfH1fRQ5KSFOKMQpE7pGnaNlm7C7TwUy5anEYw==
X-Google-Smtp-Source: AGHT+IEJ89+AicE1lZQ3XnhpL5tHd/m1IsnyOgUW94AR1BOA58fjSEzDksF9jqNKQwq8P3RC6Erj0g==
X-Received: by 2002:a17:903:166e:b0:234:b441:4d4c with SMTP id d9443c01a7336-24602317afcmr3273645ad.5.1755782975217;
        Thu, 21 Aug 2025 06:29:35 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4fd2f5sm8344077b3a.74.2025.08.21.06.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:29:34 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:29:29 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Li Li <dualli@google.com>, Tiffany Yang <ynaffit@google.com>,
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
	Alice Ryhl <aliceryhl@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v20 3/5] binder: introduce transaction reports via netlink
Message-ID: <aKcfOXcutUwoivDD@google.com>
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
> 
> Ciao, Thorsten

Judging by the regex in the error log it seems there is a new
restriction to not using underscores in the yml files. This restriction
probably raced with my patch in next. It should be very easy to fix. Can
you please try replacing the underscores?

 $ sed -i 's/_/-/' Documentation/netlink/specs/binder.yaml

I think that should fix your build. I'll try to reproduce.

--
Carlos Llamas

