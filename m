Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870291CB9C8
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 23:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbgEHV32 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 17:29:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:55386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727774AbgEHV32 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 8 May 2020 17:29:28 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E16D721582;
        Fri,  8 May 2020 21:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588973368;
        bh=H/bz1eblIk60vKqEnoGfF0LsJdD8SpMoVFSecfHLkaQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bWoB8oeD7lJqyYcltRHsiPCIzHKtGZm3iczefTg2FQryJbSqfKWkHKczvRGxrOI3K
         007lWd3UYU14VuUh95E+Blzx5o3H6dZO0x0paKWTvVowSmhRYsqMvkhMaKjpDh/5R6
         0SowGIrI6rXwCkRmjwUxtbHv2pkxeFTnkTw7ZvdE=
Date:   Fri, 8 May 2020 14:29:27 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Ira Weiny <ira.weiny@intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-Id: <20200508142927.eb07ecdf462f5287c221fa18@linux-foundation.org>
In-Reply-To: <20200508145123.GA1431382@iweiny-DESK2.sc.intel.com>
References: <20200507221721.0330271c@canb.auug.org.au>
        <20200508114338.02d2b843@canb.auug.org.au>
        <20200507190808.c6cdd5ffd68d0a154ef8ff18@linux-foundation.org>
        <20200508145123.GA1431382@iweiny-DESK2.sc.intel.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 8 May 2020 07:51:23 -0700 Ira Weiny <ira.weiny@intel.com> wrote:

> This should probably be squashed into that patch though...
> 
> Andrew do you want a V3.1?

Is OK, I'll always fold foo-fix.patch into foo.patch before sending it onwards.
