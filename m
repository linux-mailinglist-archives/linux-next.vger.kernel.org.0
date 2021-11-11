Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A6544DD42
	for <lists+linux-next@lfdr.de>; Thu, 11 Nov 2021 22:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234146AbhKKVtp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Nov 2021 16:49:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:53044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229868AbhKKVtm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Nov 2021 16:49:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63A1461247;
        Thu, 11 Nov 2021 21:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636667212;
        bh=R3pNMNJDuUIg+CdyKZN4T6gv4YmjD0jbvMUSpRNfGkA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=bsdZfk4CuvMayFrYt7Hdf0IYLbb98RQNTmAGvJ/e9Z4dSkIfPZ3yI82zVIhtj4tgJ
         7+qK/i9bCxUwlMUVh7mI1k7wtDMNDGX5924V8rtCvWo1Uyse64iWp+Xw64UOT3FQom
         Z77HxBnwsbNkgaO53h1y2hsGQ7Z2fKdy8J+Opc54z39KZzQK7fibyvmvEu3UStdPAU
         KZYzklY7lH9VOxeLYiXhKc6i9sa+kcxXwDyAhVT5t1jngKflSLsOhxptLKfz5NtWCB
         COIX6ifztlB5GxEY+rdvdKjWSC9oy0+3ELjT3GuI6OYqXoyKz6Pt8RHCTusj/kMQdY
         Pp5qXzvfTinEA==
Date:   Thu, 11 Nov 2021 22:46:49 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: unexpected file in commit in hid tree
In-Reply-To: <20211112081721.45529b69@canb.auug.org.au>
Message-ID: <nycvar.YFH.7.76.2111112246160.12554@cbobk.fhfr.pm>
References: <20211112081721.45529b69@canb.auug.org.au>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 12 Nov 2021, Stephen Rothwell wrote:

> Hi all,
> 
> Commit
> 
>   b763dc3f17a2 ("HID: intel-ish-hid: fix module device-id handling")
> 
> added this unexpected file:
> 
>   include/linux/mod_devicetable.h.rej

Bah, I have absolutely no idea how it ended up there, I must have 
fat-fingerd git add badly when resolving the conflict.

Thanks for the report, fixed version now pushed out.

-- 
Jiri Kosina
SUSE Labs

