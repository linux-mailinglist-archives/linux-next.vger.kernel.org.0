Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6940232A1A
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 04:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgG3CfH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 22:35:07 -0400
Received: from namei.org ([65.99.196.166]:56480 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726319AbgG3CfH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jul 2020 22:35:07 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id 06U2Z3Ml004552;
        Thu, 30 Jul 2020 02:35:03 GMT
Date:   Thu, 30 Jul 2020 12:35:03 +1000 (AEST)
From:   James Morris <jmorris@namei.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the security tree
In-Reply-To: <20200730093500.334c56cb@canb.auug.org.au>
Message-ID: <alpine.LRH.2.21.2007301233210.3625@namei.org>
References: <20200708140034.546298ff@canb.auug.org.au> <20200713120419.33cf7a87@canb.auug.org.au> <20200730093500.334c56cb@canb.auug.org.au>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 30 Jul 2020, Stephen Rothwell wrote:

> > I am still applying the above patch ...
> 
> The merge window is coming up fast ... is anything happening about this
> failure?

A new patch is coming, but I'm not sure this code has had enough review 
from the core VFS folk.

Please drop secure_uffd_v5.9 for the time being.


-- 
James Morris
<jmorris@namei.org>

