Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A14A1D7D94
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 17:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgERP5O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 11:57:14 -0400
Received: from foss.arm.com ([217.140.110.172]:43358 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727040AbgERP5O (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 May 2020 11:57:14 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAF1C106F;
        Mon, 18 May 2020 08:57:13 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AD073F52E;
        Mon, 18 May 2020 08:57:12 -0700 (PDT)
Subject: Re: linux-next: Signed-off-by missing for commit in the scmi tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200518210823.760fee29@canb.auug.org.au>
From:   =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <89150adf-be9d-b816-3ea7-029c599bdca1@arm.com>
Date:   Mon, 18 May 2020 16:56:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518210823.760fee29@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 18/05/2020 12:08, Stephen Rothwell wrote:
> Commit
> 
>   17a37ff76e95 ("arm64: dts: juno: Use proper DT node name for USB")
> 
> is missing a Signed-off-by from its author.

Oh, sorry for that and thanks for spotting this!

Sudeep, many thanks for the quick fix and update!

Cheers,
Andre

> 
> Also, the commit message tags should be separated from the rest of the
> commit message by a blank line.
> 

