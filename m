Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C76791EEC82
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 22:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgFDU5H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 16:57:07 -0400
Received: from linux.microsoft.com ([13.77.154.182]:36334 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725952AbgFDU5H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 16:57:07 -0400
Received: from [192.168.1.14] (unknown [76.104.235.235])
        by linux.microsoft.com (Postfix) with ESMTPSA id E175120B7185;
        Thu,  4 Jun 2020 13:57:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E175120B7185
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1591304227;
        bh=Wgn0x3zC/o4zblELYidkRAENBz/ajl7eE6ze+n4i+58=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=W6PfPVKVNfCF7A/5tLhh6/6oaQ5Gkzp+2zaVW0Zd97RGfMwrn17II0v9RsMl/c+jF
         HLz+4P4yZA/R4fsJ9NgT9qcWlkj9hUgVw5YX19L882wIy6Ai7jHfePemA649MXr1OZ
         n6AFDnoCccmf7XL3+Ee26Toxm5c3p5hQJo9ZrYmc=
Subject: Re: [PATCH] software node: recursively unregister child swnodes
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <20200604193623.16946-1-jorhand@linux.microsoft.com>
 <20200604201523.GA1308830@kroah.com>
From:   Jordan Hand <jorhand@linux.microsoft.com>
Message-ID: <c6150824-60d3-11ad-ba1a-e75d6a7a916e@linux.microsoft.com>
Date:   Thu, 4 Jun 2020 13:57:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200604201523.GA1308830@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/4/20 1:15 PM, Greg Kroah-Hartman wrote:
> On Thu, Jun 04, 2020 at 12:36:23PM -0700, jorhand@linux.microsoft.com wrote:
>> From: Jordan Hand <jorhand@linux.microsoft.com>
>>
>> If a child swnode is unregistered after it's parent, it can lead to
>> undefined behavior.
> 
> Crashing the system is not really "undefined" :)

Fair point :)

> 
>> When a swnode is unregistered, recursively free it's children to avoid
>> this condition.
> 
> Are you sure?  Why would you be unregistering a child after it's parent?
> Why not just do not do that?
> 

The main motivation for doing this was to support 
`software_node_unregister_nodes` so that the passed list of nodes does 
not need to be ordered in any particular way.

I suppose another way to do this would be to add a new function 
`fwnode_remove_software_node_recursive` and just call that from 
`software_node_unregister_nodes`.

That said, I suppose just ordering the nodes so that children come 
before parents would also be fine. My thinking was just that accepting 
any node ordering is simpler.

Thanks,
Jordan
