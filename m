Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F812ADEF6
	for <lists+linux-next@lfdr.de>; Tue, 10 Nov 2020 20:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730770AbgKJTAs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Nov 2020 14:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgKJTAs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Nov 2020 14:00:48 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D02C0613D1;
        Tue, 10 Nov 2020 11:00:48 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kcYse-002z22-W0; Tue, 10 Nov 2020 19:00:37 +0000
Date:   Tue, 10 Nov 2020 19:00:36 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20201110190036.GT3576660@ZenIV.linux.org.uk>
References: <20201027151414.2018d5fd@canb.auug.org.au>
 <20201027045912.GG3576660@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027045912.GG3576660@ZenIV.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 27, 2020 at 04:59:12AM +0000, Al Viro wrote:

> I'll rebase that branch on top of sparc tree tomorrow (and eventually I'd like
> it to go through the sparc tree anyway).

Done - sorry for disappearing ;-/
