Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB1491EEE39
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 01:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgFDX2p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 19:28:45 -0400
Received: from linux.microsoft.com ([13.77.154.182]:57494 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbgFDX2p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 19:28:45 -0400
Received: from [192.168.1.14] (unknown [76.104.235.235])
        by linux.microsoft.com (Postfix) with ESMTPSA id 711F420B7185;
        Thu,  4 Jun 2020 16:28:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 711F420B7185
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1591313324;
        bh=SZx4mnEbdx0jLMmcddD/XN81elbqYULWlDyY/auymck=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=Q4bE/AylBlX91O0u3WVMecvFQfigbf1uRWUFyUFkIlchLbAke0ZcQrCaCsSXSNVsw
         cFTQe3Jx9DvJPcyYSTrODJf30EJCcoiIhvV+tjVoqCUmcZ4E6xNYugNNGYgdkBM6y9
         Wg/I8QdU9qF0hCTPjAQQUKmXUTuCUAKSjuSlf0og=
Subject: Re: [PATCH] software node: recursively unregister child swnodes
From:   Jordan Hand <jorhand@linux.microsoft.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <20200604193623.16946-1-jorhand@linux.microsoft.com>
 <20200604201523.GA1308830@kroah.com>
 <c6150824-60d3-11ad-ba1a-e75d6a7a916e@linux.microsoft.com>
Message-ID: <4f3020b9-b693-c8cc-ec3e-8df96da45f33@linux.microsoft.com>
Date:   Thu, 4 Jun 2020 16:28:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c6150824-60d3-11ad-ba1a-e75d6a7a916e@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/4/20 1:57 PM, Jordan Hand wrote:
> On 6/4/20 1:15 PM, Greg Kroah-Hartman wrote:
>> On Thu, Jun 04, 2020 at 12:36:23PM -0700, jorhand@linux.microsoft.com 
> 
> That said, I suppose just ordering the nodes so that children come 
> before parents would also be fine. My thinking was just that accepting 
> any node ordering is simpler.
> 

Oh, actually I just tried that out and software_node_register_nodes 
doesn't allow this (parents must be added before children).

So I still think software_node_register_nodes and 
software_node_unregister_nodes are made more useful if children are 
removed recursively. I'll make some changes for v2 to make the change 
less far-reaching + better documentation.

Thanks,
Jordan
