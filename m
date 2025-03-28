Return-Path: <linux-next+bounces-6078-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A886A7523E
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 22:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95C81188FDC0
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 21:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3896C1EF399;
	Fri, 28 Mar 2025 21:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIvW+7iD"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C792186294;
	Fri, 28 Mar 2025 21:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743199080; cv=none; b=R1uZQJYobWL5worG2QvghzW5RDB3mjr/Btck/GV25nCNUkOhMBzRS1b/gy46IT9YZ3t+Dx5Oss2coh+wAw2ujsRhN6Mv1nEZ/GNeM/pqy92gtplu0VS5Lxt7RlLc+rl1RHlE+cDA7r95CUMxoFrZbp2Jv4r103+d4edmi/3HoT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743199080; c=relaxed/simple;
	bh=OxznrNYf3lSirHy91oukZ5v3RIBmVhPpxY1KFo5KKW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgeenlEg3dI2QgHyv048owOd+2SJUKX02cieS3KQXJWKKikyt6jpi00NSb/N3F5W01iZ10Me2iVzEnV6sOj7/JEMulOX14I/nWh07h+d02RyHIUIYSKSF/KH+D2JlOSPj7AHaIZgL21c0CR7gzzks+edbVZRczoanZIG6eXS1WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIvW+7iD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C951C4CEE4;
	Fri, 28 Mar 2025 21:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743199079;
	bh=OxznrNYf3lSirHy91oukZ5v3RIBmVhPpxY1KFo5KKW0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=uIvW+7iDcLahy75y/CjDDpOCE9/9cOE52rkwzvs7XBQXtgBSqsyaVeqqJOgj+qH5C
	 DsR3QsyvodbV2ZN2XOc58ZoIvs0oUZXOcEJ6JkDobOOonNxkSpPPGT5oX3FwsHItKH
	 +fSj2LBJp3FTi/DHUTF05QoiixB8ad0XO6feuFycl3+LndRG4JuBrxUnObneNBkE+d
	 naIaZUEVgWkZ7B4CmkrMmuvwYuB/eu19tmz0DfdNGGaUKdyDU5vzkOWqqg9Ioz9Zws
	 W3DsY41BaLGbOcN3VJ8vNH2TxqX8OR2VGhwYK3xUEeoks1M6SxYcP+5h0WRxntAoJy
	 64/xPLOQFopjA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 21C75CE0889; Fri, 28 Mar 2025 14:57:59 -0700 (PDT)
Date: Fri, 28 Mar 2025 14:57:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dave Jiang <dave.jiang@intel.com>
Cc: linux-cxl@vger.kernel.org, dave@stgolabs.net,
	jonathan.cameron@huawei.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com, gourry@gourry.net,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <51e9823c-784c-4b91-99d4-0500aaf5cec0@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
 <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>
 <52a34c97-88d2-415e-a899-6583ae3ba620@paulmck-laptop>
 <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>

On Fri, Mar 28, 2025 at 02:22:21PM -0700, Dave Jiang wrote:
> 
> 
> On 3/28/25 1:45 PM, Paul E. McKenney wrote:
> > On Fri, Mar 28, 2025 at 01:03:19PM -0700, Dave Jiang wrote:
> >>
> >>
> >> On 3/28/25 10:39 AM, Paul E. McKenney wrote:
> >>> Hello!
> >>>
> >>> In next-20250328 and next-20250327, allmodconfig builds get me:
> >>>
> >>> ./usr/include/cxl/features.h:11:10: fatal error: uuid/uuid.h: No such file or directory
> >>>
> >>> This file is apparently auto-generated, because when I change the #include
> >>> to the more likely linux/uuid.h, my changes are overwritten by the build.
> >>>
> >>> Gregory Price noted that something similar has happened recently and been fixed:
> >>>
> >>> https://lore.kernel.org/all/70ba4e80-53c4-4583-82f3-2851e0829aa6@linux.ibm.com/
> >>>
> >>> Perhaps someone unfixed it?
> >>>
> >>> 								Thanx, Paul
> >>
> >>
> >> I can't get the powerpc cross build to build to reproduce the issue from next-20250328. Does the change below address the issue for you?
> >>
> >> ---
> >> diff --git a/include/uapi/cxl/features.h b/include/uapi/cxl/features.h
> >> index d6db8984889f..691eeda9c892 100644
> >> --- a/include/uapi/cxl/features.h
> >> +++ b/include/uapi/cxl/features.h
> >> @@ -8,11 +8,7 @@
> >>  #define _UAPI_CXL_FEATURES_H_
> >>  
> >>  #include <linux/types.h>
> >> -#ifndef __KERNEL__
> >> -#include <uuid/uuid.h>
> >> -#else
> >>  #include <linux/uuid.h>
> >> -#endif
> >>  
> >>  /*
> >>   * struct cxl_mbox_get_sup_feats_in - Get Supported Features input
> > 
> > Thank you, Dave!
> > 
> > Please note that I am reproducing this not on powerpc, but instead on
> > x86 with a simple allmodconfig build.
> > 
> > Making the above change got me this:
> > 
> > usr/include/cxl/features.h:59:9: error: unknown type name ‘uuid_t’
> 
> I wasn't able to hit that with allmodconfig on x86 with a Fedora 41 build setup. What is the specific command lines you are using?

make clean
make allmodconfig
make -j$N

Though encapsulated as follows:

tools/testing/selftests/rcutorture/bin/torture.sh --do-none --do-allmodconfig

							Thanx, Paul

