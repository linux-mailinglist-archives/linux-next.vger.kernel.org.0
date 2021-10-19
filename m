Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C334D4336E4
	for <lists+linux-next@lfdr.de>; Tue, 19 Oct 2021 15:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235466AbhJSNXa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Oct 2021 09:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbhJSNX3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Oct 2021 09:23:29 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D627CC06161C;
        Tue, 19 Oct 2021 06:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=GevZs/a8xWOsf4/BG4XLBlFSGbW9x5dz83z4G9jb0EQ=; b=d+VRpY/VkfivaxBtAUhznbRhmj
        tinwcHfwXiP6YT1qvX/du/s8SeoD/cb5Lb5qshrkSO17TQnKE0TRjIPUuR+PPDNvMxeZBIPatRY6g
        Qd68kiIyAzxH+lTeva3KPSdxR/mYnfPQmtRU1VWeWmd1mqur+GR9H4CiGskrQfv7SMSkk6VgLSKm1
        /D++3Hlp42lAjARvIoZMP2Vr7J7BrEo9NSy5f94qP8lXwk2Vzz7vFcS037kk0Innnnyu+c4p1yAz1
        2DQxb5l80xIjQezY+iOFFBDcvK9BKqE2kJ0mCxbwWCSZDi9BBJBFkOQFV3kjPf33CrqDhNfbk/ZpH
        RhQdTTCw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mcp2u-00AmG7-NJ; Tue, 19 Oct 2021 13:20:49 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DB2AB300288;
        Tue, 19 Oct 2021 15:20:45 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id CB5D7212B2C00; Tue, 19 Oct 2021 15:20:45 +0200 (CEST)
Date:   Tue, 19 Oct 2021 15:20:45 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>,
        "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] docs: futex: Fix kernel-doc references
Message-ID: <YW7GLTdP3TAcg9Ac@hirez.programming.kicks-ass.net>
References: <20211012135549.14451-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211012135549.14451-1-andrealmeid@collabora.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 12, 2021 at 10:55:49AM -0300, André Almeida wrote:
> Since the futex code was restructured, there's no futex.c file anymore
> and the implementation is split in various files. Point kernel-doc
> references to the new files.
> 
> Signed-off-by: André Almeida <andrealmeid@collabora.com>

Thanks!
