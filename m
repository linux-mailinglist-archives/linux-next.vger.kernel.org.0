Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14106257333
	for <lists+linux-next@lfdr.de>; Mon, 31 Aug 2020 06:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgHaExS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Aug 2020 00:53:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:50604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgHaExR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 31 Aug 2020 00:53:17 -0400
Received: from kernel.org (unknown [87.70.91.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23D7D20719;
        Mon, 31 Aug 2020 04:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598849597;
        bh=zZlZOKBvQCa9q1swSMh6UKazBpijMwGQCUZNTNlXztU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sysjg2+1Cv9h8cmqonDwElO0pcD0zLnWB9hmNm9fLcAECJaliJXg14ddaG0Imyyi6
         RZ5HBq+aGuzlq61pmu8RpIbg3R4k2JEJsVmeKxWMSjz4FWrXJmMSBM0mMtNzE5xtZ1
         g3QUWuaIxKJdBDbg/TVQ1yM0zCJ38fgOQ5O3hbkU=
Date:   Mon, 31 Aug 2020 07:53:11 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2] Documentation: submit-checklist: add clean builds for
 new Documentation
Message-ID: <20200831045311.GB432455@kernel.org>
References: <cf5bbdf5-03ff-0606-a6d4-ca196d90aee9@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf5bbdf5-03ff-0606-a6d4-ca196d90aee9@infradead.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Aug 30, 2020 at 05:43:54PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Add to Documentation/process/submit-checklist.rst that patch
> submitters should run "make htmldocs" and verify that any
> Documentation/ changes (patches) are clean (no new warnings/errors).
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mike Rapoport <rppt@kernel.org>

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
> v2: insert "new" inside "without warnings/errors" (Mike)
> 
>  Documentation/process/submit-checklist.rst |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> --- linux-next-20200821.orig/Documentation/process/submit-checklist.rst
> +++ linux-next-20200821/Documentation/process/submit-checklist.rst
> @@ -24,6 +24,10 @@ and elsewhere regarding submitting Linux
>  
>    c) Builds successfully when using ``O=builddir``
>  
> +  d) Any Documentation/ changes build successfully without new warnings/errors.
> +     Use ``make htmldocs`` or ``make pdfdocs`` to check the build and
> +     fix any issues.
> +
>  3) Builds on multiple CPU architectures by using local cross-compile tools
>     or some other build farm.
>  
> 

-- 
Sincerely yours,
Mike.
