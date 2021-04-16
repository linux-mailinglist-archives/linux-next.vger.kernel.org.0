Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F7D361AF4
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 10:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238160AbhDPH57 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Apr 2021 03:57:59 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46590 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhDPH57 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Apr 2021 03:57:59 -0400
Received: from [IPv6:2a02:810a:880:f54:c1fa:1310:49b:e88e] (unknown [IPv6:2a02:810a:880:f54:c1fa:1310:49b:e88e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E7E581F4170A;
        Fri, 16 Apr 2021 08:57:33 +0100 (BST)
Subject: Re: linux-next: Fixes tag needs some work in the iommu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210416075141.0b3a4e6e@canb.auug.org.au>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <3073677f-37c7-bb89-741f-239f2222191b@collabora.com>
Date:   Fri, 16 Apr 2021 09:57:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210416075141.0b3a4e6e@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 15.04.21 23:51, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    af5247b169a0 ("iommu/mediatek: Always enable the clk on resume")
> 
> Fixes tag
> 
>    Fixes: commit c0b57581b73b ("iommu/mediatek: Add power-domain operation")
> 
> has these problem(s):
> 
>    - leading word 'commit' unexpected
> 

Hi, I'll send v2,

Thanks,
Dafna
