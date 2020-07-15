Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1872208F2
	for <lists+linux-next@lfdr.de>; Wed, 15 Jul 2020 11:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729953AbgGOJhq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jul 2020 05:37:46 -0400
Received: from [195.135.220.15] ([195.135.220.15]:42902 "EHLO mx2.suse.de"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S1728820AbgGOJhq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jul 2020 05:37:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id CB805AC50;
        Wed, 15 Jul 2020 09:37:47 +0000 (UTC)
Date:   Wed, 15 Jul 2020 11:37:43 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: failing to fetch the dmi tree
Message-ID: <20200715113743.6d54eefa@endymion>
In-Reply-To: <20200713091102.28d186ca@canb.auug.org.au>
References: <20200713091102.28d186ca@canb.auug.org.au>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, 13 Jul 2020 09:11:02 +1000, Stephen Rothwell wrote:
> Attempting to fetch the dmi tree gets this error:
> 
> http://jdelvare.nerim.net/devel/linux/jdelvare-dmi/series:
> 2020-07-13 08:58:05 ERROR 403: Forbidden.
> 
> I am still using the previously fetched quilt series.

Sorry about that, there was a general failure on my provider's web
server over last week-end, not something I could fix myself. It got
eventually fixed on Monday morning (July 13th, CEST).

> Jean, I don't suppose you would like to produce a git tree for me to
> fetch instead, as yours is the last quilt series I fetch (apart from
> Andrew's which is special).

Actually, feel free to suppose. While a quilt tree fits my current
workflow better, I don't want to be the guy who makes your life more
difficult. Let me give it a try.

-- 
Jean Delvare
SUSE L3 Support
