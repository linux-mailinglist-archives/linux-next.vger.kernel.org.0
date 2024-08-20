Return-Path: <linux-next+bounces-3364-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 947DE957C69
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 06:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C2BF1C22C10
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 04:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FADE38FA6;
	Tue, 20 Aug 2024 04:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="io4Pjkj7"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCC728371;
	Tue, 20 Aug 2024 04:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724128270; cv=none; b=GYcoiz+ssaSb9DQqMZNFWUgDnp2thjA5wcm4h+GefvLLxoCFyBbvnqPp+BCebVJaP3c3Nfn67wgVslPDsEo8JufQc1xGhcvbM/cOBuAkPph+/0GhTZk9eFyEPH982uOUIYSbIlHma//WcBbKbDeA4A1YnMWGDgw1WUAuKQl6DBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724128270; c=relaxed/simple;
	bh=NOSlRAL1yuwrHw9PV+RTLu/A0aEeVBu7qRpRzXys8+E=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=tXgJQzkw6LREetbyGva12R0owGC2ePvxqlSlFCk+Z6NxsHQk6K0QiLvvKLCnhsliYjpginRptraHG0VR0NUcR31vudRQ8BAB+v/a2P7dYx6EVRMyiTWHknNIeK/a8OSMnTJeE3plEB/bTHsiPiLxXBQMOE8M1z/RLSI7DtMXFn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=io4Pjkj7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724128268; x=1755664268;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=NOSlRAL1yuwrHw9PV+RTLu/A0aEeVBu7qRpRzXys8+E=;
  b=io4Pjkj7jUygwOefvjx6f16d4q8dDvG1yH3lZCd352ZqIlXxltyF+sni
   voihcvDMJ4IM0TN+8w6SnB8BPE3uaM1zGHqV/UhuUI8nPxsAOhuNwXtYF
   bLM5JxKMTlzpafJwh3yRHIaU+GvEKMKSybmgeksOT7mvs0uiRGDDfGWKW
   2lmOrvV3Thb4Ym+LLE+8fLw5gIg/YgjPWvRfee/sYGwF8O8V+Cb7Y6IDI
   IkCbREw0CTmzk7trS+LM9p3Jbk0B4HK8LTYIM6qYsRSff6x8a11RRtQLb
   wfWJnXp3KrrGChnAw0jswJUwxgz06R1Hp0iJjEEvG7FZLgt2UL0xf/Yz/
   g==;
X-CSE-ConnectionGUID: Rk3pBy7nTpadcmonnt//vQ==
X-CSE-MsgGUID: F38r7Ve4Q6u6BI4CbTi6KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26158391"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208,223";a="26158391"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 21:31:08 -0700
X-CSE-ConnectionGUID: P+hrhqm3SXOvaBO4vqx32Q==
X-CSE-MsgGUID: xpzECGM1SQeoPZWMyhkjtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208,223";a="91319454"
Received: from mesiment-mobl2.amr.corp.intel.com (HELO [10.125.108.3]) ([10.125.108.3])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 21:31:07 -0700
Content-Type: multipart/mixed; boundary="------------EXKrPxQ0ebN9oAkkBL43Jvc1"
Message-ID: <1000902c-96f5-44f9-bad7-9fb8b5e607a4@linux.intel.com>
Date: Mon, 19 Aug 2024 21:31:06 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Jithu Joseph <jithu.joseph@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240820134354.2aec355d@canb.auug.org.au>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240820134354.2aec355d@canb.auug.org.au>

This is a multi-part message in MIME format.
--------------EXKrPxQ0ebN9oAkkBL43Jvc1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hans,

On 8/19/24 8:43 PM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the drivers-x86 tree, today's linux-next build (htmldocs)
> produced this warning:
>
> Documentation/arch/x86/ifs:2: /home/sfr/next/next/drivers/platform/x86/intel/ifs/ifs.h:131: WARNING: Title underline too short.
>
> Structural Based Functional Test at Field (SBAF):
> ------------------------------------------------
>
> Introduced by commit
>
>   0a3e4e94d137 ("platform/x86/intel/ifs: Add SBAF test image loading support")

Attached patch fixes the issue. Do you want to me send it to the mailing list or
you can take the attached patch?

>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

--------------EXKrPxQ0ebN9oAkkBL43Jvc1
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-intel-ifs-Fix-SBAF-title-underline-leng.patch"
Content-Disposition: attachment;
 filename*0="0001-platform-x86-intel-ifs-Fix-SBAF-title-underline-leng.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA3NmY2YTQzZWVhZmQ4OTJkZGU1M2I5ZmIzYzY3YWFkOTBlZmY4MWE2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBLdXBwdXN3YW15IFNhdGh5YW5hcmF5YW5hbiA8c2F0
aHlhbmFyYXlhbmFuLmt1cHB1c3dhbXlAbGludXguaW50ZWwuY29tPgpEYXRlOiBUdWUsIDIw
IEF1ZyAyMDI0IDA0OjAyOjU1ICswMDAwClN1YmplY3Q6IFtQQVRDSCB2MV0gcGxhdGZvcm0v
eDg2L2ludGVsL2lmczogRml4IFNCQUYgdGl0bGUgdW5kZXJsaW5lIGxlbmd0aAoKSW4gY29t
bWl0ICMgMGEzZTRlOTRkMTM3ICgicGxhdGZvcm0veDg2L2ludGVsL2lmczogQWRkIFNCQUYg
dGVzdCBpbWFnZQpsb2FkaW5nIHN1cHBvcnQiKSwgdGhlIGRvY3VtZW50YXRpb24gZm9yICJT
dHJ1Y3R1cmFsIEJhc2VkIEZ1bmN0aW9uYWwKVGVzdCBhdCBGaWVsZCAoU0JBRikiIGhhZCBh
biBpbmNvbXBsZXRlIHVuZGVybGluZS4gVGhpcyByZXN1bHRlZCBpbiB0aGUKZm9sbG93aW5n
IGJ1aWxkIHdhcm5pbmc6CgpEb2N1bWVudGF0aW9uL2FyY2gveDg2L2lmczoyOiBkcml2ZXJz
L3BsYXRmb3JtL3g4Ni9pbnRlbC9pZnMvaWZzLmg6MTMxOiBXQVJOSU5HOiBUaXRsZSB1bmRl
cmxpbmUgdG9vIHNob3J0LgoKRml4IGl0IGJ5IGV4dGVuZGluZyB0aGUgZG90dGVkIGxpbmVz
IHRvIG1hdGNoIHRoZSBsZW5ndGggb2YgdGhlIHRpdGxlLgoKRml4ZXM6IDBhM2U0ZTk0ZDEz
NyAoInBsYXRmb3JtL3g4Ni9pbnRlbC9pZnM6IEFkZCBTQkFGIHRlc3QgaW1hZ2UgbG9hZGlu
ZyBzdXBwb3J0IikKUmVwb3J0ZWQtYnk6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1
dWcub3JnLmF1PgpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDA4
MjAxMzQzNTQuMmFlYzM1NWRAY2FuYi5hdXVnLm9yZy5hdS9ULyN1ClNpZ25lZC1vZmYtYnk6
IEt1cHB1c3dhbXkgU2F0aHlhbmFyYXlhbmFuIDxzYXRoeWFuYXJheWFuYW4ua3VwcHVzd2Ft
eUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaWZz
L2lmcy5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaWZzL2lm
cy5oIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaWZzL2lmcy5oCmluZGV4IGIyNjFi
ZTQ2YmNlOC4uNWMzYzBkZmExYmY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4
Ni9pbnRlbC9pZnMvaWZzLmgKKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaWZz
L2lmcy5oCkBAIC0xMjksNyArMTI5LDcgQEAKICAqCiAgKgogICogU3RydWN0dXJhbCBCYXNl
ZCBGdW5jdGlvbmFsIFRlc3QgYXQgRmllbGQgKFNCQUYpOgotICogLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisgKiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgKgogICogU0JBRiBpcyBhIG5l
dyB0eXBlIG9mIHRlc3RpbmcgdGhhdCBwcm92aWRlcyBjb21wcmVoZW5zaXZlIGNvcmUgdGVz
dAogICogY292ZXJhZ2UgY29tcGxlbWVudGluZyBTY2FuIGF0IEZpZWxkIChTQUYpIHRlc3Rp
bmcuIFNCQUYgbWltaWNzIHRoZQotLSAKMi4yNS4xCgo=

--------------EXKrPxQ0ebN9oAkkBL43Jvc1--

