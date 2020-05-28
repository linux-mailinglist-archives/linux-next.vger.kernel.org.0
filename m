Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6921E61F0
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 15:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390089AbgE1NPS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 09:15:18 -0400
Received: from verein.lst.de ([213.95.11.211]:56402 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389949AbgE1NPR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 May 2020 09:15:17 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 5952868AFE; Thu, 28 May 2020 15:15:13 +0200 (CEST)
Date:   Thu, 28 May 2020 15:15:12 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alex Deucher <alexdeucher@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mukul Joshi <mukul.joshi@amd.com>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the akpm tree
Message-ID: <20200528131512.GC13108@lst.de>
References: <20200528201940.759c58ff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528201940.759c58ff@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This looks correct, thanks.
