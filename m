Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90B733AB7CD
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 17:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233463AbhFQPpt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 11:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbhFQPps (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 11:45:48 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8EFC061574;
        Thu, 17 Jun 2021 08:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=aTwiNikuPpd63jqEaYUcFa9qs8yNeiZ9YocK3TtMFOY=; b=nQ90SBZEsCSBBkRcCyLLk1oVAV
        9dFocU7Ub/dyjbIbG7hJi6OLSXwMnGIJs7NnAJ1sA3gwBJl/IBUE+ippiiRls47muyGc5RjRnRD9a
        DBAk+Pzt7DgNli6qe3T8HoXG6GzVDAwqclI7l4Y1sldEvunzxNAAywMsdnP4Z3t9/z1dt1kiBdzdG
        Z5z9LoDqpCifKn4A9QKFWFPmV+rcUqMFrknjPja8rCV2bSuBDPadV1vHFxM29y+q5OmPeP6HiNCzj
        he1efICKogaCoUpGHQr61D6KINfiZewmPQUXSY3cVUBO9UNAhOXRnkXmM7Uc5rbNBO48J0shM7rQe
        I5pmNeHw==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ltuB9-00Az2E-A9; Thu, 17 Jun 2021 15:43:39 +0000
Subject: Re: linux-next: Tree for Jun 16 (objdump version)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
References: <20210616231358.63fe6e42@canb.auug.org.au>
 <7d523bca-67d8-6da1-6739-e5ba85f7683c@infradead.org>
Message-ID: <a66ab899-3e33-9a6d-6d1b-73a291efeaa6@infradead.org>
Date:   Thu, 17 Jun 2021 08:43:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <7d523bca-67d8-6da1-6739-e5ba85f7683c@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

{correct Masami's email address}

On 6/17/21 8:07 AM, Randy Dunlap wrote:
> On 6/16/21 6:13 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20210615:
>>
> 
> on i386 or x86_64:
> 
> Warning: objdump version 15) is older than 2.19
> Warning: Skipping posttest.
> 
> 'objdump --version' says:
> 
> GNU objdump (GNU Binutils; SUSE Linux Enterprise 15) 2.35.1.20201123-7.18
> Copyright (C) 2020 Free Software Foundation, Inc.
> This program is free software; you may redistribute it under the terms of
> the GNU General Public License version 3 or (at your option) any later version.
> This program has absolutely no warranty.
> 
> 
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>

