Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3762E25817F
	for <lists+linux-next@lfdr.de>; Mon, 31 Aug 2020 21:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgHaTDP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Aug 2020 15:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727993AbgHaTDO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Aug 2020 15:03:14 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB557C061573;
        Mon, 31 Aug 2020 12:03:14 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D24B72D5;
        Mon, 31 Aug 2020 19:03:13 +0000 (UTC)
Date:   Mon, 31 Aug 2020 13:03:12 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: linux-next: build failure after upgrading sphinx
Message-ID: <20200831130312.0a2cbd0c@lwn.net>
In-Reply-To: <20200827145017.47c16c73@canb.auug.org.au>
References: <20200827145017.47c16c73@canb.auug.org.au>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 27 Aug 2020 14:50:17 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today I upgraded ot sphinx v3.2.1 and got the following error from
> "make htmldocs":
> 
> Running Sphinx v3.2.1
> enabling CJK for LaTeX builder
> 
> Extension error:
> Could not import extension cdomain (exception: cannot import name 'c_funcptr_sig_re' from 'sphinx.domains.c' (/usr/lib/python3/dist-packages/sphinx/domains/c.py))
> 
> I have downgraded to version 2.4.3 and await suggestions/patches :-)

[Adding Markus]

Markus, this looks like an issue with the "handle function-like macros"
code that has your name on it.  The Sphinx folks think that functionality
can just be removed:

	https://github.com/sphinx-doc/sphinx/issues/7421

Do you agree?  We need to look at what they're saying about the :name:
directive as well; somehow I missed that when it first went in.

Thanks,

jon
