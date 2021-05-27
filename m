Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB9E392FF4
	for <lists+linux-next@lfdr.de>; Thu, 27 May 2021 15:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236543AbhE0NoB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 May 2021 09:44:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:46036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236373AbhE0NoA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 May 2021 09:44:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA5C460FEE;
        Thu, 27 May 2021 13:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622122947;
        bh=c/L3W4ntmhHJs70AlmnrREK6uGfMAvXGVW97NOBEeXA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=VSyZ9aLIf1PMr5kHvHMy96DW1BTdgc30qRf9LqlavDQe9dIXF41YDwOGyiAk+YMud
         V6XkRS/SIeHhinfanS7s3fKANkIx+wNa6NiJ7Yl7Uja+ZCjIf5Vb0bVu7arjfHkTjD
         ivjOhUunpfrfB0g+2wEZOr0FR4+D1KG+YjBa6EWRFf5sxKWfAcluPTNrC7H4LrbcXy
         nhckGWK3Z/+0foojyweixcpUnMn6IPqYGMHBmi9udks4yP7Wg+ofVfjFIB2U6nGbG3
         9Su9cWhUpiH13mBAGl6z048SvC4TcSAd6EEEPl+Wk9JXa3b3rMt5gIbi6aE9zLZhsI
         cN/N1j7hyqXBA==
Date:   Thu, 27 May 2021 15:42:24 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the hid tree
In-Reply-To: <e5ee42f7-b0eb-40c7-e54f-8e16e8b97b68@redhat.com>
Message-ID: <nycvar.YFH.7.76.2105271542090.28378@cbobk.fhfr.pm>
References: <20210527152631.1e70fba2@canb.auug.org.au> <nycvar.YFH.7.76.2105271012430.28378@cbobk.fhfr.pm> <e5ee42f7-b0eb-40c7-e54f-8e16e8b97b68@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 27 May 2021, Hans de Goede wrote:

> >> After merging the hid tree, today's linux-next build (x86_64
> >> modules_install (on an allmodconfig build)) failed like this:
> >>
> >> depmod: ERROR: Cycle detected: hid -> usbhid -> hid
> >> depmod: ERROR: Found 2 modules in dependency cycles!
> >>
> >> I could not easily figure out what caused this (it may not be the hid
> >> tree, but probably is), so all I could do was leave it broken.
> > 
> > This is caused by Hans' patches (CCed). I will be dropping those today, as 
> > the proper fix needs a bit more of rework.
> 
> Ack, sorry about the trouble these patches are causing.

for-next has now been rebased with the three relevant commits removed.

Thanks,

-- 
Jiri Kosina
SUSE Labs

