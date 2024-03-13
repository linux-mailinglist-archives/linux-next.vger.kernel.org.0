Return-Path: <linux-next+bounces-1625-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E687B45B
	for <lists+linux-next@lfdr.de>; Wed, 13 Mar 2024 23:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDA8928540A
	for <lists+linux-next@lfdr.de>; Wed, 13 Mar 2024 22:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69EE45A0F7;
	Wed, 13 Mar 2024 22:30:10 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DBA5A0ED
	for <linux-next@vger.kernel.org>; Wed, 13 Mar 2024 22:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710369010; cv=none; b=ESADSOmEcjFFADh13mps/AFEU3Hvd3ztzYXuKvZJfQj6j/RDsBl0LlWDXwMtvuoVoGrMiu9IOcjh8TRzRFZLbed5E3HSJofa42UhSjTF60DY6F/+CJ4lq03jWHAP8F6kjisXB8ipieRUXmryspbUv3UEt/86SWBaixE0LdXM8U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710369010; c=relaxed/simple;
	bh=zA8L9dl/wSQf3LOsBJYCnKq9EQ/7B4f8HMex6+vNx78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kabxQ37AsPBhv5TqfZOrs26ahZD3GyBtVvQtj/1O5X8TUuerGmbBvY50Pf0bySWKsRRpqg3Br1ADz3z9kShNcPI0Nh5R9e0fG3z3mH9uYXtySpOR46rdVHv3k/THbNRrYfSgmNyKNCk7ygrQhhSekGnSfku5I/lsxRybzIRJ4Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=redhat.com; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-690b24973beso11730616d6.0
        for <linux-next@vger.kernel.org>; Wed, 13 Mar 2024 15:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710369007; x=1710973807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypwN72D6WSiCXDEdFEW1ml1qZjShXgvR6WGCfg4MWiw=;
        b=SmzWZmV2Gad0+C7LeAlO9/vcrQRz17JU2s7gWEiIP02H9N/PKCCgG7UWUYAE70g1Hd
         WrKLIbFgJ5oPVthGL3TjxOSNr+nOW7Vlr1G9gfTcPZtsQOwrtQnEB3t8geJl686nT9dy
         gXm9OP2izXF6DLP0W6FSdMnKtDPqAtLzqAJs2H11UFHUKwmZ1hnQa+dVtj0rFVlxcJPN
         Y1iq9d+2d6Om1751a03rQCEyOz6XqWEz1CcBIxMMBkI5lPJpkiUTQy+YkfEfkbkBIPfJ
         49Il5t2KvTfFx+mdkic8dvcyCvF4O8i7BH9e2oxE5xXDl6krAK5G7KgIs7sIvcayGxtQ
         NJ2A==
X-Forwarded-Encrypted: i=1; AJvYcCW3Zz/gYRYi2Mh3NwE0hezrpVVFoP6lg6Eal+07ghtQn90FxohjEL4xQoe1g1T91Ez99i0VWWjGQ8E1UHC5b0+q/DxdglYta4gpjQ==
X-Gm-Message-State: AOJu0Yw0/DCbQNtyzyBh9vYW0YQSltlboXZXQyeY/gZylTuQ0rC3Hq26
	rV7oYRgp2ENvDLEeMZe6TUVPdt6uqn2j1ARcY4KcBU2FVAFGTZKgu531eWBhSg==
X-Google-Smtp-Source: AGHT+IGnCLzp/F/J8tCSNp7XYXpPLqx0Zr077oVBAbRRQhX+oK2RKVWjZjJUrYBSm9qIIENOAZUndA==
X-Received: by 2002:a05:6214:2589:b0:690:abe6:b6d3 with SMTP id fq9-20020a056214258900b00690abe6b6d3mr2319628qvb.4.1710369007658;
        Wed, 13 Mar 2024 15:30:07 -0700 (PDT)
Received: from localhost (pool-68-160-141-91.bstnma.fios.verizon.net. [68.160.141.91])
        by smtp.gmail.com with ESMTPSA id 7-20020a05621420a700b00690bfb6aac7sm115430qvd.51.2024.03.13.15.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 15:30:07 -0700 (PDT)
Date: Wed, 13 Mar 2024 18:30:06 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the device-mapper tree
Message-ID: <ZfIo7nbWA3pSeY3z@redhat.com>
References: <20240314084050.2fe3eb9f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314084050.2fe3eb9f@canb.auug.org.au>

On Wed, Mar 13 2024 at  5:40P -0400,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
> 
>   2da6b3c1317e ("Revert "dm: use queue_limits_set"")
> 
> This is commit
> 
>   bff4b74625fe ("Revert "dm: use queue_limits_set"")
> 
> in Linus' tree.

Sorry about that, fixed it up.

