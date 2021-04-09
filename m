Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A201835A2EB
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 18:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233674AbhDIQUe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 12:20:34 -0400
Received: from mail-co1nam11on2095.outbound.protection.outlook.com ([40.107.220.95]:43361
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233527AbhDIQUe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Apr 2021 12:20:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpQldijyGSazgSIVNLdK6r2j7XOz6tR2F2YSIkiOMaTlx0mLghiTcSqeLyxKGfWW8QZ8PEBg6qE5fjHT7xhelrW7W61S/SdLnGz1HAQ3+d2J5t61XdkjAp98FqXpZRLsRvGnRNkipwPQKzCGqJ/OXnn/J84ppTrnulyRGZk18xW+GZJPnM7yx/QVqGtaMaBzbjo2tFbTnRuHadYV8PyIl4bOC5SuPTCezFHXkZSNIvdl3FLtH7ClUab0ciGROMfEANIOjKhOLWRBE2b+199EJ06op7Ve7gsUstwSr6tcsCrLZm6zxry7Fq4p47HWf7pDeX3dERrMtOHZg9YRn0gwHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+4JT0PemIlNe+GjK3siapLgy9b3TD+tu1Rrty6G5Xs=;
 b=cNPMarIGHG+y2nJZOIyruuBgrkZUWYDi8MwkZ6YGkIj36ZuicKM392q0ktIqbaQwIBeqaTi8FI81wirFa45uvR8VVWfB369+VSBe8f+g+HydD5yel6+W7iL9KBlk0CXxBaFYHFM4UAyS93kjB9iRqS2LAwB/gruiX/8ZRBL6cRQl7nsOPf89QpkG8OY8LMCwvsFxOys4EJjac2QpvAOGhfBC3gR+eb+nnt5KK/hyb/rWw4iMkkm4mWROwLy1EP5LMerQsiaiQ8E5IuzPzA/y/9Ar6jlxLsKRIF02TDMcNLFbrlXj7Y7yAVtwuDROxqtsr1Cxp33Z3PwhlMgJmLEuDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cornelisnetworks.com; dmarc=pass action=none
 header.from=cornelisnetworks.com; dkim=pass header.d=cornelisnetworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cornelisnetworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+4JT0PemIlNe+GjK3siapLgy9b3TD+tu1Rrty6G5Xs=;
 b=IzLMbLJNG+uviviPL2IO41BRudHCMWSJBUy3OlW0yQymiD8+dkiho1su68iEktszk6UzVOuC2GbIFNwyfyH9PQLHhIzvmZcSlxiRBpDk0S3cSc3Vg/w4VycVTNCJ+ax1pznYOtDEhY/wsJHoTsnwNhZmAtaeXkPy4Z8YreQdDSR6jWA5cVKl9/UJctWfWo4YNUQCYdjZngT1wHMCf5uxVLaRZw3z8Fhb1xrt+d3DPP1yCwJRtE4bYxfJ6ei3V5C7y6LFq8QVYp0jSMWfsc2+mcN0MbvztqTTHxeMcjTFt6J9dykynvSASIPZv8FEis8DFyF/AHTdWXaCSA3iT6lzsw==
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=cornelisnetworks.com;
Received: from PH0PR01MB6439.prod.exchangelabs.com (2603:10b6:510:d::22) by
 PH0PR01MB6745.prod.exchangelabs.com (2603:10b6:510:96::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21; Fri, 9 Apr 2021 16:20:19 +0000
Received: from PH0PR01MB6439.prod.exchangelabs.com
 ([fe80::75a5:79c6:dd14:3860]) by PH0PR01MB6439.prod.exchangelabs.com
 ([fe80::75a5:79c6:dd14:3860%5]) with mapi id 15.20.3999.032; Fri, 9 Apr 2021
 16:20:19 +0000
Subject: Re: linux-next: Signed-off-by missing for commit in the rdma tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210409080055.421f0dee@canb.auug.org.au>
From:   Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Message-ID: <95642f46-f23f-3aa6-7614-a8f4a7109fc4@cornelisnetworks.com>
Date:   Fri, 9 Apr 2021 12:20:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210409080055.421f0dee@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.154.216.5]
X-ClientProxiedBy: BL0PR02CA0094.namprd02.prod.outlook.com
 (2603:10b6:208:51::35) To PH0PR01MB6439.prod.exchangelabs.com
 (2603:10b6:510:d::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.40.159] (24.154.216.5) by BL0PR02CA0094.namprd02.prod.outlook.com (2603:10b6:208:51::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend Transport; Fri, 9 Apr 2021 16:20:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b54d5f0d-76f3-4ee8-7830-08d8fb735e23
X-MS-TrafficTypeDiagnostic: PH0PR01MB6745:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR01MB6745BC9288BE45062A96DA44F4739@PH0PR01MB6745.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PHaIW1KJOXnX39sD+zlM8ttSICI3NqOlzRfL4i0lDJtO1cWrFr/3F77zjrGLmzLlr2Y2OCwTlF7otvLJYyfnYb8Vuzu3kY3dLqNyq9ExH5J5RWQ10+lH+wSbvqaRUe2pYwFuRIB93Sjfase08EhYaGN+TSxEYOT56HeeD1TDi2FlFetX6Ywt+JUi6mJ817bk9W16ZNN43ba6KY/fyCcq22TVMCmWF7Km4XPDgxUAPjPljH2w9l+Tk1G/mI9lZOBNLuNzhYrWFgmr5zsyqGY46GsQzOOBBeaJHuv02TIzn9vZDs8PzePUi2bv+wtTilkbyK6xf0ChrzPMhA75sMJFzssfQvSKlrO61DyEUJ5VrricOJHCfXBVfVm9hWgHQVtzEDL/3raPsDoD2jzrTgA0415n85aK46h2K7BoQB40e4A0FgXwry5XX4hssN+21UIDRQxexJ6E2tB2LMnAUKVRVns/JPMYoao7B1eKbXPKzUzGIDMUlC6V9eCQItjmH/cNTLZS6CGjW6hT00hqeqFZXufawPOKoWFPz2hjL5Hf5Yuac/OSY4oTjV45TvX300kd2CwzXp3TTFhT0HQ1bn7cqz/g5xKGmWMJiFlRkoVnkrj9hw6ItuayYanL+WsATYjEvHTL9G8D249y+VX5adO+K0gLJNC40McnScf/opNjuQ6vRRPGbc2f5E4BG7xxa0eerqTS1abjena1rKjTlX3re1iIzZQ/821xJlYa0lUEHfc7ATWIIGjsXyD02zm3phMD/SJsCvQt+uxRPXaqpi6xN3ivPNM8uhPzntBNrRhkzt4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB6439.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(8936002)(6486002)(38100700001)(110136005)(16576012)(54906003)(16526019)(53546011)(38350700001)(8676002)(4744005)(2906002)(26005)(52116002)(186003)(44832011)(6666004)(5660300002)(2616005)(956004)(86362001)(83380400001)(34490700003)(66946007)(36756003)(4326008)(31696002)(31686004)(66556008)(508600001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?o1SbXXxkcm0JEA8hxzvJgXw2q8Yz36iWkzbxQtwjSmQId4iafWIbdGPT?=
 =?Windows-1252?Q?Gegx2q3CeMxkIwoxAkgeVhoEEIO6/bvAkQeJJgngmi1tiDJbNSZSUn+h?=
 =?Windows-1252?Q?6DsrGrxAH+PQT9BGz2whAQ4jPYVkZNc13UJ0m43kEHEcA3iThh3JNX5y?=
 =?Windows-1252?Q?O9Z3qagUHhCBfs1yqFZBKrbC8j4BCOMTaCMcg/6C0e7MglEHBYOyvllq?=
 =?Windows-1252?Q?3lUia2ln934AfFNkpn0e4JB1nQeqZNyqO2zbUHpoOwiIoXvc7iaT1pEA?=
 =?Windows-1252?Q?SRA/M7qfZEI1hukneDdqom6aymbjLAGAYlOWmYKOU9dKGjGri0IW8VPn?=
 =?Windows-1252?Q?ULkWIecytvrx+I2lHrc3d6hDmwq4XJU18/ED6fvdtSi3Y8shw3TXrh4G?=
 =?Windows-1252?Q?bKnY0nij0VGKPcrYdD3Xyv8NxdgoNREDgz/ibY3cEI2y5JKII/0tQP5m?=
 =?Windows-1252?Q?IRPz2HJVqKlpqUdP2apqbzlLR8gSKskwAGp7i6eK++4z/ydD0fnfSYpc?=
 =?Windows-1252?Q?39UsbbQe+bbLGBqYcY1y5BAyRXvseKk2VGqKH3yLiQnEdvAYSU9pGcS2?=
 =?Windows-1252?Q?6z7hqaYkRtCq1NuE8auakHqEQ3DXrJwnXu4TQQ2uHMmZuHdjKIlixtg7?=
 =?Windows-1252?Q?flaXud+x0KhbB7YqulqynCvd0B60//1NGLY9vXWKtmxHlbx12PBrhRq+?=
 =?Windows-1252?Q?QX9q8u6E7XLET6HHW50/TEaoKtlOPi/0wF3xe2fC8UNJ4OmWKLdhGxL+?=
 =?Windows-1252?Q?MDsqkm2RRdBHpJvVqXM4PGSez5ajMuUgbxUhzTzRdHgPxBlUmIqL4Jad?=
 =?Windows-1252?Q?tpS+oWfqVJwj32PF/43YFqZ//iTBUNXrpwCzJ2LS43iNungdeqGiKBqW?=
 =?Windows-1252?Q?DbOwnQ33eWiuS8M+2XtW1x6zL+A+pIN6FIfp2a1F33NW9CwB5Idd+jet?=
 =?Windows-1252?Q?NHGUN9FkvviP0pEpHLgiOTJuBcOj8mZq3ZY5ZneRqUqze/UZlG4kTMKz?=
 =?Windows-1252?Q?5c+fOh2y+KIpLxsxfiOd/E6RjeQYpq00yIsjGmCpnMgRUIRwAZV0MFpN?=
 =?Windows-1252?Q?1T6+Gusx4S6VkDzXRTrXjUqpBiQI2665b0Vz4F9lb2kFR1XMoZ4g32u/?=
 =?Windows-1252?Q?3k8rKuImk6AW0sswR00JN1yIOkqbfGTL51nG9dfuue703leGUGd7WTyZ?=
 =?Windows-1252?Q?k913dIoiN9m2wOyfiIez66eYzr8F9aw6ymgXnqcbNqM25gIP4tPVDfSu?=
 =?Windows-1252?Q?EnXzayrzu9PBikgoVp5l9OtBjU1jaieiQp9kKHzR2TEVg9eg56N53m7n?=
 =?Windows-1252?Q?G1mkYQTx+hTTv7v7yn5jjlxepTuOH/SAiN1bkrBXFgvgIkYsP3sxSUPJ?=
 =?Windows-1252?Q?ztmMnLUp9gSyu/xnRRGo+aqsK5/+EBUc7FYx/OiMWAYK/muHvCLo7hOa?=
X-OriginatorOrg: cornelisnetworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b54d5f0d-76f3-4ee8-7830-08d8fb735e23
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB6439.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 16:20:19.3761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4dbdb7da-74ee-4b45-8747-ef5ce5ebe68a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGoy8FkHU3bsB6pp6X5dj5d5r8dwowqBWSDaXgS/oAd+IEQX9hKBJF5jXF/dFaZcvEY41ZH0Fu3LCGwSRXiJlYNuMPz3sTuyVEHIch72zvGp5kVRb4hgdu11bE1o+3U5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6745
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/8/2021 6:00 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>    042a00f93aad ("IB/{ipoib,hfi1}: Add a timeout handler for rdma_netdev")
> 
> is missing a Signed-off-by from its author.

Doh! That's my fault. I must have fat fingered the delete button instead 
of editing the line when I was converting our email addresses to the new 
name.

Jason do you want a v2 of the patch?

-Denny

