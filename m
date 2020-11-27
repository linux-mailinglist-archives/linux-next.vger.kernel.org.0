Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5DEB2C6BAF
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 19:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728993AbgK0SnS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 13:43:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728995AbgK0SnC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2020 13:43:02 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D2CC0613D1;
        Fri, 27 Nov 2020 10:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=iUrRzu4PdjL5GQARPtIddUD1oOrMB3S2jTSowUjaD3U=; b=Sl93U8vImcXcYKJDk+mwjzxsml
        p7MXo5r6Rb9LS5k2Lb/TCEVe8eNgeM5XnfQAsSmrfHrK9hwVjXN6LNO0oYSABuauGn6B6wLjyOWVU
        zQu6SPt4cyWOWTj8Zz+J1EF03ptdBKvSCmlSrJfsEWXRap+fTlL0C74aZvnpvx/KOjVKjmGyaBVpL
        DZsMNwiZrIWO39EgtJBK/lXGs0J7cAzrj61bcTfhppJ4QqWhh9m4UvhaTc2l0THAHfWLGXRkO33rB
        RxL7XpYr94bJ0ILfSn/1qduu2f90enktiFlT5QJf+g2SmmeLisikjucjoG/jH0Or2Tl2cPqmR9oup
        SzAJGFKg==;
Received: from [2601:1c0:6280:3f0::cc1f]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kiii8-0000oG-9W; Fri, 27 Nov 2020 18:43:12 +0000
Subject: Re: linux-next: Tree for Nov 27 (parisc: signal flags)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
References: <20201127200457.1ffb6aaf@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <155a20fd-09c4-df35-9cc6-8526a89c2933@infradead.org>
Date:   Fri, 27 Nov 2020 10:43:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127200457.1ffb6aaf@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/27/20 1:04 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20201126:
> 

on parisc, _SA_SIGGFAULT is undefined and causing build errors.

commit 23acdc76f1798b090bb9dcc90671cd29d929834e
Author: Peter Collingbourne <pcc@google.com>
Date:   Thu Nov 12 18:53:34 2020 -0800

    signal: clear non-uapi flag bits when passing/returning sa_flags



_SA_SIGGFAULT is not used or defined anywhere else in the
kernel source tree.

-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
