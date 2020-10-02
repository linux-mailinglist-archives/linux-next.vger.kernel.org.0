Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5601C281DF2
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 23:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgJBV7t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 17:59:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:60500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgJBV7t (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 2 Oct 2020 17:59:49 -0400
Received: from X1 (c-76-21-107-111.hsd1.ca.comcast.net [76.21.107.111])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC29420719;
        Fri,  2 Oct 2020 21:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601675987;
        bh=GX3SlIpSpsmf0/iZGt5G8efHVWaAJE8GOD956nTu+uM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hrjjWRl7Pc8btXlVDSBjiNYuf9lAmJ6uyjjkUzgArCfosqCfS6P2aPfBC46vYPVrt
         CqHeM9+i3hWZZ2yc2N+04/TJPWej7hPMA0jvCvT13jf18EE5Ja4KfTqp7pLQ2xI2Ou
         vyWsKDrnVOMYVUzAIYGw2PGZ9LSs+6b4rYGqO9w4=
Date:   Fri, 2 Oct 2020 14:59:45 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
Subject: Re: [PATCH v2 2/2] selftests/vm: fix run_vmtest.sh: restore
 executable bits, and "s" in name
Message-Id: <20201002145945.c5abb5f57dbeac30351b7757@linux-foundation.org>
In-Reply-To: <20201002084049.556824-3-jhubbard@nvidia.com>
References: <20201002084049.556824-1-jhubbard@nvidia.com>
        <20201002084049.556824-3-jhubbard@nvidia.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 2 Oct 2020 01:40:49 -0700 John Hubbard <jhubbard@nvidia.com> wrote:

> commit cb2ab76685d7 ("selftests/vm: rename run_vmtests -->
> run_vmtests.sh") changed the name of run_vmtests to run_vmtest.sh, but
> inadvertently dropped the executable bits.

We cannot depend on the x bit.  Because downloading linux-foo.patch.gz
and installing it with patch(1) is a supported way of obtaining Linux. 
And patch(1) loses the x bit.

If $(CONFIG_SHELL) is unavailable then invoking the script with
"/bin/sh foo.sh" should do the trick.

> Somehow the name is missing an "s", too. Fix both of these problems by
> renaming, and restoring the executable bits.

But that's what your patch did!

tools/testing/selftests/vm/{run_vmtests => run_vmtest.sh} | 0

Here: https://lkml.kernel.org/r/20200929212747.251804-4-jhubbard@nvidia.com


So all confused.  I'll drop this version - please redo and resend when
convenient?
